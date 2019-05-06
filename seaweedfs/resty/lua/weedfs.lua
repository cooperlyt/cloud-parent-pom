local http = require "resty.http"
local cjson = require "cjson"

local weedfs = {}

function weedfs:put(put_url,put_fid)
    ngx.req.read_body()
    local res = ngx.location.capture(
        "/weedfs/_put", {method = ngx.HTTP_PUT,args={fid=put_fid, url=put_url},share_all_vars = true}
        )

        if res then
            return res.status , res.body
        else
            ngx.log(ngx.ERR,'weedfs put error:', ngx.var.weed_img_root_url , err);
            return 504;
        end
end

function weedfs:delete(del_fid)
	local res = ngx.location.capture(
        "/weedfs/_delete", {method = ngx.HTTP_DELETE,args={fid=del_fid},share_all_vars = true}
        )
    if res then
        return res.status , res.body
    else
        ngx.log(ngx.ERR,'weedfs delete error:', ngx.var.weed_img_root_url , err);
        return 504;
    end
end

function weedfs:assing()
    local hc = http.new()
    local res,err = hc:request_uri(ngx.var.weed_img_root_url .. "dir/assign")
    if res then
        return res.status , res.body
    else
        ngx.log(ngx.ERR,'weedfs assing error:', ngx.var.weed_img_root_url , err);
        return 504;
    end
    
end

function weedfs:lookup(volume_id)
    local hc = http.new()
    local res,err = hc:request_uri(ngx.var.weed_img_root_url .. "dir/lookup?volumeId="..volume_id)
    return res.status , res.body
end

function weedfs:upload()
    local code , body = self:assing()
    if code ~= 200 then
        ngx.log(ngx.ERR,'weedfs assing error code:',  code);
        return code, body
    else   
        ngx.log(ngx.DEBUG,"assing complete!")
        local assing_info = cjson.decode(body) 
        local put_code, put_body = weedfs:put(assing_info.publicUrl,assing_info.fid);
        if put_code ~= 201 then
            return put_code, put_body
        else
        
            local result_info = cjson.decode(put_body)
            result_info.fid = assing_info.fid
            ngx.log(ngx.DEBUG,"upload complete! fid:",assing_info.fid,"body",put_body)
            return put_code, result_info
        end  
    end

end

return weedfs