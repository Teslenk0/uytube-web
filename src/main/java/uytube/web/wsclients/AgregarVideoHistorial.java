
package uytube.web.wsclients;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para agregarVideoHistorial complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="agregarVideoHistorial">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="arg0" type="{http://interfaces/}dtVideo" minOccurs="0"/>
 *         &lt;element name="arg1" type="{http://interfaces/}dtCanal" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "agregarVideoHistorial", propOrder = {
    "arg0",
    "arg1"
})
public class AgregarVideoHistorial {

    protected DtVideo arg0;
    protected DtCanal arg1;

    /**
     * Obtiene el valor de la propiedad arg0.
     * 
     * @return
     *     possible object is
     *     {@link DtVideo }
     *     
     */
    public DtVideo getArg0() {
        return arg0;
    }

    /**
     * Define el valor de la propiedad arg0.
     * 
     * @param value
     *     allowed object is
     *     {@link DtVideo }
     *     
     */
    public void setArg0(DtVideo value) {
        this.arg0 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg1.
     * 
     * @return
     *     possible object is
     *     {@link DtCanal }
     *     
     */
    public DtCanal getArg1() {
        return arg1;
    }

    /**
     * Define el valor de la propiedad arg1.
     * 
     * @param value
     *     allowed object is
     *     {@link DtCanal }
     *     
     */
    public void setArg1(DtCanal value) {
        this.arg1 = value;
    }

}
