
namespace Surf {
    public class Application : Adw.Application {
        public Application () {
            Object (application_id: "app.magicalsoft.Surf", flags: ApplicationFlags.DEFAULT_FLAGS);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new Surf.Window (this);
            }
            win.present ();
        }

        private void on_about_action () {
            string[] developers = { "Shota Shimazu" };
            var about = new Adw.AboutWindow () {
                transient_for = this.active_window,
                application_name = "surf",
                application_icon = "app.magicalsoft.Surf",
                developer_name = "Shota Shimazu",
                version = "0.1.0",
                developers = developers,
                copyright = "© 2024 Shota Shimazu",
            };

            about.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
