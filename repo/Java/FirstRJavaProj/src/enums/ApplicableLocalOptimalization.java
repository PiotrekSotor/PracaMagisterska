package enums;

public enum ApplicableLocalOptimalization {

    NELDER_MEAD("Nelder-Mead", "fun1"),
    BFGS("BFGS", "fun2"),
    CG("CS", "fun3"),
    L_BFGS_B("L-BFGS-B", "fun4"),
    SANN("SANN", "fun5");

    private ApplicableLocalOptimalization(String rName, String guiName) {
        functionRName = rName;
        this.guiName = guiName;
    }

    private String functionRName;
    private String guiName;

    public String getFunctionRName() {
        return functionRName;
    }

    public String getGuiName() {
        return guiName;
    }
}
