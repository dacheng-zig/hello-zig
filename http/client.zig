const std = @import("std");
const http = std.http;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // initialize the http client with proxy and allocator
    var client = http.Client{
        .allocator = allocator,
    };
    defer client.deinit();

    const uri = try std.Uri.parse("http://localhost/");

    // create buffer for reading response header
    var header_buffer: [256]u8 = undefined;

    // prepare request options
    const options = http.Client.RequestOptions{
        .server_header_buffer = &header_buffer,
        .keep_alive = true,
        .headers = http.Client.Request.Headers{
            // use a custom user-agent
            .user_agent = http.Client.Request.Headers.Value{ .override = "zig-http-client/1.0" },
        },
    };

    var request = try client.open(http.Method.GET, uri, options);
    defer request.deinit();

    // send the request
    try request.send();

    // when send with body, must call finish() after send()
    // try request.finish();

    // wait until we get the response (header) and parse header
    try request.wait();

    // read response body
    const body = try request.reader().readAllAlloc(allocator, 1024);
    defer allocator.free(body);

    // output the length of response content, and the response content
    std.debug.print("response content length: {}\n", .{request.response.content_length.?});
    std.debug.print("{s}\n", .{body});
}
