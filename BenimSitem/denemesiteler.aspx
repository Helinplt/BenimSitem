<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="denemesiteler.aspx.cs" Inherits="BenimSitem.denemesiteler" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <title></title>
    <style>
           :root {
       --mor: #7c4dff; /* mor */
       --pembe: #ff6ec7; /* pembe */
       --mavi: #5ec5ff; /* mavi */
       --lacivert: #0c1b4d; /* lacivert */
       --gece: #0b1020; /* koyu arka plan */
       --acik: #f7f9fc; /* açık arka plan */
       --beyaz: #ffffff;
       --card: rgba(255,255,255,0.08);
       --glass: rgba(255,255,255,0.6);
       --border: rgba(255,255,255,0.18);
       --shadow: 0 10px 30px rgba(12, 27, 77, 0.25);
       --radius: 18px;
       --radius-lg: 26px;
       --grad-hero: radial-gradient(1200px 800px at 10% -10%, rgba(124,77,255,.35), transparent 60%), radial-gradient(800px 600px at 90% 0%, rgba(255,110,199,.30), transparent 60%), radial-gradient(900px 700px at 50% 120%, rgba(94,197,255,.30), transparent 60%), linear-gradient(180deg, #0a0f2a 0%, #0c1334 60%, #101944 100%);
       --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
       --grad-stroke: linear-gradient(135deg, rgba(255,110,199,.6), rgba(94,197,255,.6));
   }

   * {
       box-sizing: border-box;
   }

   html, body {
       height: 100%;
   }

   body {
       margin: 0;
       font-family: 'Poppins', system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
       color: #e8ecf7;
       background: var(--gece);
       overflow-x: hidden;
   }

    </style>
</head>
<body>
      <uc:Header ID="Header1" runat="server" />
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
      <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />
</body>
</html>
