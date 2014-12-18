/**
 * Created by denis on 16.12.2014.
 */
package test {
import flash.display.Sprite;
import flash.text.TextField;

public class Application extends Sprite {

    public function Application() {
        var txt = new TextField();
        txt.text = "hello from sample";
        addChild(txt)
    }
}

}
