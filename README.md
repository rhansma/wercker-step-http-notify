# http-notify

Send http request to specified url(a.k.a. webhook)

## Options
### required

 * `url` - Your webhook url

### optional
 * `headers` - The headers send with the request, for example for authorization
 * `method` - The request method used (eg. POST, GET)

## Passed parameters

 * `result` - result of step. `passed` or not.
 * `type` - type of step. `build` or `deploy`.
 * `application_owner_name`
 * `application_name`
 * `build_url`
 * `git_branch`
 * `started_by`

## Example

Add HOOK_URL as deploy target or application environment variable.

    build:
       after-steps:
          - robinhansma/http-notify:
              url: $HOOK_URL
              headers: $HOOK_HEADERS
              method: $HOOK_REQUEST_METHOD

