local weedfs = require "weedfs"
local cjson = require "cjson"
local http = require "resty.http"

local code , body = weedfs:upload()

local args = ngx.req.get_uri_args()

if code == 201 or code == 202 then
    local hc = http.new()
    local res,err = hc:request_uri(ngx.var.api_server .. "/" .. args.item .. "/" .. body.fid)
    ngx.status = res.status
    ngx.say(res.body)
    ngx.exit(res.status)
else
    ngx.exit(code)
end

