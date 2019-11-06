
package uytube.web.wsclients;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para funcionAuxiliarAccesoDt complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="funcionAuxiliarAccesoDt">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="arg0" type="{http://interfaces/}dtAuxiliarValorar" minOccurs="0"/>
 *         &lt;element name="arg1" type="{http://interfaces/}dtListaporDefecto" minOccurs="0"/>
 *         &lt;element name="arg2" type="{http://interfaces/}dtListaDefectoVideos" minOccurs="0"/>
 *         &lt;element name="arg3" type="{http://interfaces/}dtListaParticularVideos" minOccurs="0"/>
 *         &lt;element name="arg4" type="{http://interfaces/}dtValorar" minOccurs="0"/>
 *         &lt;element name="arg5" type="{http://interfaces/}dtauxComentarios" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "funcionAuxiliarAccesoDt", propOrder = {
    "arg0",
    "arg1",
    "arg2",
    "arg3",
    "arg4",
    "arg5"
})
public class FuncionAuxiliarAccesoDt {

    protected DtAuxiliarValorar arg0;
    protected DtListaporDefecto arg1;
    protected DtListaDefectoVideos arg2;
    protected DtListaParticularVideos arg3;
    protected DtValorar arg4;
    protected DtauxComentarios arg5;

    /**
     * Obtiene el valor de la propiedad arg0.
     * 
     * @return
     *     possible object is
     *     {@link DtAuxiliarValorar }
     *     
     */
    public DtAuxiliarValorar getArg0() {
        return arg0;
    }

    /**
     * Define el valor de la propiedad arg0.
     * 
     * @param value
     *     allowed object is
     *     {@link DtAuxiliarValorar }
     *     
     */
    public void setArg0(DtAuxiliarValorar value) {
        this.arg0 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg1.
     * 
     * @return
     *     possible object is
     *     {@link DtListaporDefecto }
     *     
     */
    public DtListaporDefecto getArg1() {
        return arg1;
    }

    /**
     * Define el valor de la propiedad arg1.
     * 
     * @param value
     *     allowed object is
     *     {@link DtListaporDefecto }
     *     
     */
    public void setArg1(DtListaporDefecto value) {
        this.arg1 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg2.
     * 
     * @return
     *     possible object is
     *     {@link DtListaDefectoVideos }
     *     
     */
    public DtListaDefectoVideos getArg2() {
        return arg2;
    }

    /**
     * Define el valor de la propiedad arg2.
     * 
     * @param value
     *     allowed object is
     *     {@link DtListaDefectoVideos }
     *     
     */
    public void setArg2(DtListaDefectoVideos value) {
        this.arg2 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg3.
     * 
     * @return
     *     possible object is
     *     {@link DtListaParticularVideos }
     *     
     */
    public DtListaParticularVideos getArg3() {
        return arg3;
    }

    /**
     * Define el valor de la propiedad arg3.
     * 
     * @param value
     *     allowed object is
     *     {@link DtListaParticularVideos }
     *     
     */
    public void setArg3(DtListaParticularVideos value) {
        this.arg3 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg4.
     * 
     * @return
     *     possible object is
     *     {@link DtValorar }
     *     
     */
    public DtValorar getArg4() {
        return arg4;
    }

    /**
     * Define el valor de la propiedad arg4.
     * 
     * @param value
     *     allowed object is
     *     {@link DtValorar }
     *     
     */
    public void setArg4(DtValorar value) {
        this.arg4 = value;
    }

    /**
     * Obtiene el valor de la propiedad arg5.
     * 
     * @return
     *     possible object is
     *     {@link DtauxComentarios }
     *     
     */
    public DtauxComentarios getArg5() {
        return arg5;
    }

    /**
     * Define el valor de la propiedad arg5.
     * 
     * @param value
     *     allowed object is
     *     {@link DtauxComentarios }
     *     
     */
    public void setArg5(DtauxComentarios value) {
        this.arg5 = value;
    }

}
