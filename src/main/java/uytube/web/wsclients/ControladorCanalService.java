
package uytube.web.wsclients;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "ControladorCanalService", targetNamespace = "http://controladores/", wsdlLocation = "http://localhost:17184/CanalWs?wsdl")
public class ControladorCanalService
    extends Service
{

    private final static URL CONTROLADORCANALSERVICE_WSDL_LOCATION;
    private final static WebServiceException CONTROLADORCANALSERVICE_EXCEPTION;
    private final static QName CONTROLADORCANALSERVICE_QNAME = new QName("http://controladores/", "ControladorCanalService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:17184/CanalWs?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        CONTROLADORCANALSERVICE_WSDL_LOCATION = url;
        CONTROLADORCANALSERVICE_EXCEPTION = e;
    }

    public ControladorCanalService() {
        super(__getWsdlLocation(), CONTROLADORCANALSERVICE_QNAME);
    }

    public ControladorCanalService(WebServiceFeature... features) {
        super(__getWsdlLocation(), CONTROLADORCANALSERVICE_QNAME, features);
    }

    public ControladorCanalService(URL wsdlLocation) {
        super(wsdlLocation, CONTROLADORCANALSERVICE_QNAME);
    }

    public ControladorCanalService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, CONTROLADORCANALSERVICE_QNAME, features);
    }

    public ControladorCanalService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public ControladorCanalService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns IControladorCanal
     */
    @WebEndpoint(name = "ControladorCanalPort")
    public IControladorCanal getControladorCanalPort() {
        return super.getPort(new QName("http://controladores/", "ControladorCanalPort"), IControladorCanal.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns IControladorCanal
     */
    @WebEndpoint(name = "ControladorCanalPort")
    public IControladorCanal getControladorCanalPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://controladores/", "ControladorCanalPort"), IControladorCanal.class, features);
    }

    private static URL __getWsdlLocation() {
        if (CONTROLADORCANALSERVICE_EXCEPTION!= null) {
            throw CONTROLADORCANALSERVICE_EXCEPTION;
        }
        return CONTROLADORCANALSERVICE_WSDL_LOCATION;
    }

}