package interfaces;

public abstract class AbstractJavaInvoker {

    public abstract String getRCommand();

    protected String createSequence(Double from, Double to, Double by) {
        StringBuilder sb = new StringBuilder();
        sb.append("seq(");
        sb.append(from.toString());
        sb.append(", ");
        sb.append(to.toString());
        sb.append(", by=");
        sb.append(by.toString());
        sb.append(")");
        return sb.toString();
    }
}
