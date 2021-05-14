// @ts-ignore
import { Elm } from "../backend/Main.elm";

export type Msg = "Increment" | "Decrement" | "Nothing";

interface ElmMain {
    subscribe: (subscription: (n: number) => void) => (() => void); 
    set: (type: Msg) => void
}

const app = Elm.Main.init();

export const elm_main: ElmMain = {
    set(type: Msg) {
        app.ports.messageReceiver.send(type);
    },
    subscribe(fn: (n: number) => void) {

        app.ports.sendMessage.subscribe(fn);

        fn(0)

        return () => {
            app.ports.sendMessage.unsubscribe(fn);
        }
    }
} 
