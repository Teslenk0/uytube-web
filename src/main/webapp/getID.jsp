<%-- 
    Document   : getID
    Created on : 13 oct. 2019, 16:36:32
    Author     : tesla
--%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>

<%!
    public String getID(String url){
                        String id = null;
                        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
                        Pattern compiledPattern = Pattern.compile(pattern);

                        
                            if ( url != null) {
                                Matcher matcher = compiledPattern.matcher(url); //url is youtube url for which you want to extract the id.
                                if (matcher.find()) {
                                    id = matcher.group();
                                } else {
                                    id = null;
                                }

                            }
                        return id;
}
%>
