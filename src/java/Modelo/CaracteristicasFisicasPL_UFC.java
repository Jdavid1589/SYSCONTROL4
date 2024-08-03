
package Modelo;


public class CaracteristicasFisicasPL_UFC {
    
    
        private VariableUFC variableUFC;
        private String valor;

    public CaracteristicasFisicasPL_UFC(VariableUFC variableUFC, String valor) {
        this.variableUFC = variableUFC;
        this.valor = valor;
    }
        
        
        

    public VariableUFC getVariableUFC() {
        return variableUFC;
    }

    public void setVariableUFC(VariableUFC variableUFC) {
        this.variableUFC = variableUFC;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
        
        
        
        
        
}
