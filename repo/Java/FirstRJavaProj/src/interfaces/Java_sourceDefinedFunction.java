package interfaces;

import java.util.Optional;

public class Java_sourceDefinedFunction extends AbstractJavaInvoker {

    String functionBody;

    @Override
    public String getRCommand() {
        return Optional.ofNullable(functionBody).orElse(new String());
    }

    public Java_sourceDefinedFunction withFunctionBody(String body) {
        functionBody = body;
        return this;
    }

}
