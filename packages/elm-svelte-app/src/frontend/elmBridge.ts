// @ts-ignore
import { Elm } from "../backend/Main.elm";

export type Msg = "Increment" | "Decrement" | "Nothing";

interface ElmMain {
    subscribe: (subscription: (n: number) => void) => (() => void); 
    set: (type: Msg) => void
}

// Initial value that we pass down to elm context and when the elm bride store gets called the first time.
const initialValue = 0;

const app = Elm.Main.init({flags: initialValue});

export const elm_main: ElmMain = {
    set(type: Msg) {
        app.ports.messageReceiver.send(type);
    },
    subscribe(fn: (n: number) => void) {

        app.ports.sendMessage.subscribe(fn);

        // Elm does not run fn first time it subscribes to it so we 
        // need to manually call it with the initial value the first
        // time the store gets called.
        fn(initialValue);

        return () => {
            app.ports.sendMessage.unsubscribe(fn);
        }
    }
} 
