using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SiteInProgress.Startup))]
namespace SiteInProgress
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
