function consigoURL() {
        var paramstr = window.location.search.substr(1);
        var paramarr = paramstr.split("&");
        var params = {};
        var url;
        for (var i = 0; i < paramarr.length; i++) {
            var tmparr = paramarr[i].split("=");
            params[tmparr[0]] = tmparr[1];
        }
        if (params['variable1']) {
            url = params['variable1'];
        }
        return url;
}