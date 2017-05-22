package interfaces;

import main.ApplicableFunction;

public class Java_plotFunction3DInvoker extends AbstractJavaInvoker {

    ApplicableFunction function;
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

    public Java_plotFunction3DInvoker withXRange(float from, float to, float by) {
        xRange = createSequence(from, to, by);
        return this;
    }

    public Java_plotFunction3DInvoker withYRange(float from, float to, float by) {
        yRange = createSequence(from, to, by);
        return this;
    }

    public Java_plotFunction3DInvoker withApplicableFunction(ApplicableFunction function) {
        this.function = function;
        return this;
    }

    public Java_plotFunction3DInvoker withDimensions(Integer height, Integer width) {
        this.height = height;
        this.width = width;

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
        sb.append(function.getrName());

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
