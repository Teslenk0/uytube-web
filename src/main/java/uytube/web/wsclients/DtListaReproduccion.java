
package uytube.web.wsclients;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtListaReproduccion complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtListaReproduccion">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nombreLista" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="canal" type="{http://interfaces/}dtCanal" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtListaReproduccion", propOrder = {
    "nombreLista",
    "canal"
})
@XmlSeeAlso({
    DtListaParticulares.class
})
public abstract class DtListaReproduccion {

    protected String nombreLista;
    protected DtCanal canal;

    /**
     * Obtiene el valor de la propiedad nombreLista.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreLista() {
        return nombreLista;
    }

    /**
     * Define el valor de la propiedad nombreLista.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreLista(String value) {
        this.nombreLista = value;
    }

    /**
     * Obtiene el valor de la propiedad canal.
     * 
     * @return
     *     possible object is
     *     {@link DtCanal }
     *     
     */
    public DtCanal getCanal() {
        return canal;
    }

    /**
     * Define el valor de la propiedad canal.
     * 
     * @param value
     *     allowed object is
     *     {@link DtCanal }
     *     
     */
    public void setCanal(DtCanal value) {
        this.canal = value;
    }

}
