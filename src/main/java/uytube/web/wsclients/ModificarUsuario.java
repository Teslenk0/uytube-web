
package uytube.web.wsclients;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para modificarUsuario complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="modificarUsuario">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="arg0" type="{http://interfaces/}dtUsuario" minOccurs="0"/>
 *         &lt;element name="arg1" type="{http://interfaces/}dtCanal" minOccurs="0"/>
 *         &lt;element name="arg2" type="{http://interfaces/}bufferedImage" minOccurs="0"/>
 *         &lt;element name="arg3" type="{http://www.w3.org/2001/XMLSchema}boolean" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "modificarUsuario", propOrder = {
    "arg0",
    "arg1",
    "arg2",
    "arg3"
})
public class ModificarUsuario {

    protected DtUsuario arg0;
    protected DtCanal arg1;
    protected BufferedImage arg2;
    protected Boolean arg3;

    /**
     * Obtiene el valor de la propiedad arg0.
     * 
     * @return
     *     possible object is
     *     {@link DtUsuario }
     *     
     */
    public DtUsuario getArg0() {
        return arg0;
    }

    /**
     * Define el valor de la propiedad arg0.
     * 
     * @param value
     *     allowed object is
     *     {@link DtUsuario }
     *     
     */
    public void setArg0(DtUsuario value) {
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

    /**
     * Obtiene el valor de la propiedad arg2.
     * 
     * @return
     *     possible object is
     *     {@link BufferedImage }
     *     
     */
    public BufferedImage getArg2() {
        return arg2;
    }

    /**
     * Define el valor de la propiedad arg2.
     * 
     * @param value
     *     allowed object is
     *     {@link BufferedImage }
     *     
     */
    public void setArg2(BufferedImage value) {
        this.arg2 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg3.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isArg3() {
        return arg3;
    }

    /**
     * Define el valor de la propiedad arg3.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setArg3(Boolean value) {
        this.arg3 = value;
    }

}
