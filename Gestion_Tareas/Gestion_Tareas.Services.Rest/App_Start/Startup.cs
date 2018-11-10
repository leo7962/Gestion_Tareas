using Owin;
using Xomega.Framework;
using Microsoft.Owin.Cors;

namespace Gestion_Tareas.Services.Rest
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            AppInitializer.Initalize(new AppServicesInit());
            app.UseCors(CorsOptions.AllowAll);
            ConfigureOAuth(app);
            ConfigureWebApi(app);
        }
    }
}
