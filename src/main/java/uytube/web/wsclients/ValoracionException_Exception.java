
package uytube.web.wsclients;

import javax.xml.ws.WebFault;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebFault(name = "ValoracionException", targetNamespace = "http://interfaces/")
public class ValoracionException_Exception
    extends Exception
{

    /**
     * Java type that goes as soapenv:Fault detail element.
     * 
     */
    private ValoracionException faultInfo;

    /**
     * 
     * @param faultInfo
     * @param message
     */
    public ValoracionException_Exception(String message, ValoracionException faultInfo) {
        super(message);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @param faultInfo
     * @param cause
     * @param message
     */
    public ValoracionException_Exception(String message, ValoracionException faultInfo, Throwable cause) {
        super(message, cause);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @return
     *     returns fault bean: uytube.web.wsclients.ValoracionException
     */
    public ValoracionException getFaultInfo() {
        return faultInfo;
    }

}
