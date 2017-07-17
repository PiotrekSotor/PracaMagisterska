package interfaces;

public class Java_plotFunction3DInvoker extends AbstractJavaInvoker {

    String function;
    String destinationPath;
    String xRange;
    String yRange;

    Integer height;
    Integer width;

    public Java_plotFunction3DInvoker() {
        height = 600;
        width = 800;
    }

    public String getDestinationPath() {
        return destinationPath;
    }

    public Java_plotFunction3DInvoker withXRange(Double from, Double to, Double by) {
        xRange = createSequence(from, to, by);
        return this;
    }

    public Java_plotFunction3DInvoker withYRange(Double from, Double to, Double by) {
        yRange = createSequence(from, to, by);
        return this;
    }

    public Java_plotFunction3DInvoker withFunction(String function) {
        this.function = function;
        return this;
    }

    public Java_plotFunction3DInvoker withDimensions(double d, double e) {
        this.height = (int) d;
        this.width = (int) e;

        return this;
    }

    public Java_plotFunction3DInvoker withDestinationPath(String path) {
        StringBuilder sb = new StringBuilder();
        sb.append(path);
        if (!path.endsWith(".png")) {
            if (path.endsWith("/")) {
                sb.append("filename");
            }
            sb.append(".png");
        }
        destinationPath = sb.toString();
        return this;
    }

    @Override
    public String getRCommand() {
        StringBuilder sb = new StringBuilder();
        sb.append("java_plotFunction3D(");

        sb.append("fun=");
        sb.append(function);

        sb.append(", destinationPath=\"");
        sb.append(destinationPath);

        sb.append("\", xRange=");
        sb.append(xRange);

        sb.append(", yRange=");
        sb.append(yRange);

        sb.append(", height=");
        sb.append(height);

        sb.append(", width=");
        sb.append(width);

        sb.append(")");
        return sb.toString();

    }

}
