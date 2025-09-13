<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactWidget.ascx.cs" Inherits="BenimSitem.ContactWidget" %>


<style>

    /* === Floating Contact Widget === */
.contact-widget{
  position: fixed;
  right: 22px;
  bottom: 22px;
  z-index: 9999;
  display: flex;
  gap: 12px;
  padding: 10px 12px;
  border-radius: 14px;
  background: rgba(255,255,255,.92);
  border: 1px solid rgba(0,0,0,.06);
  box-shadow: 0 18px 40px rgba(12,27,77,.22);
  backdrop-filter: blur(6px);
}

/* Koyu temaya uyum */
@media (prefers-color-scheme: dark){
  .contact-widget{
    background: rgba(18,22,44,.92);
    border-color: rgba(255,255,255,.10);
  }
}

.cw-btn{
  position: relative;
  display: grid;
  place-items: center;
  width: 46px;
  height: 46px;
  border-radius: 12px;
  text-decoration: none;
  transition: transform .15s ease, box-shadow .2s ease, background .2s ease, border-color .2s ease;
  background: #fff;
  border: 1px solid rgba(0,0,0,.06);
  box-shadow: 0 8px 20px rgba(0,0,0,.08);
  color: #1a2a6b;
}

@media (prefers-color-scheme: dark){
  .cw-btn{
    background: rgba(255,255,255,.06);
    border-color: rgba(255,255,255,.12);
    color: #dfe7ff;
  }
}

.cw-btn:hover,
.cw-btn:focus-visible{
  transform: translateY(-2px);
  box-shadow: 0 12px 28px rgba(0,0,0,.18);
  outline: none;
}

/* İkon renkleri */
.cw-btn i{ font-size: 22px; line-height: 1; }
.cw-btn.whatsapp i{ color: #25D366; }
.cw-btn.phone i{ color: #245DCE; }
.cw-btn.callback i{ color: #7c4dff; }

/* Hover/Focus etiketleri */
.cw-btn .label{
  position: absolute;
  bottom: calc(100% + 8px);
  left: 50%;
  transform: translate(-50%, 6px);
  background: #111827;
  color: #fff;
  font-size: 12px;
  font-weight: 600;
  padding: 8px 10px;
  border-radius: 10px;
  white-space: nowrap;
  pointer-events: none;
  opacity: 0;
  transition: opacity .18s ease, transform .18s ease;
  box-shadow: 0 10px 20px rgba(0,0,0,.25);
  border: 1px solid rgba(255,255,255,.12);
}
@media (prefers-color-scheme: dark){
  .cw-btn .label{ background: rgba(22,26,56,.96); }
}
.cw-btn .label::after{
  content:"";
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  border: 6px solid transparent;
  border-top-color: rgba(17,24,39,1);
}
.cw-btn:hover .label,
.cw-btn:focus-visible .label{
  opacity: 1;
  transform: translate(-50%, 0);
}

/* Mobil boyutlar */
@media (max-width: 600px){
  .contact-widget{ right: 12px; bottom: 12px; gap: 10px; padding: 8px 10px; }
  .cw-btn{ width: 44px; height: 44px; }
}



</style>


<!-- Hızlı İletişim Widget -->
<link rel="stylesheet" href="/Content/contact-widget.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />


<div class="contact-widget" role="navigation" aria-label="Hızlı iletişim">
  <!-- Telefon -->
  <a runat="server" id="lnkPhone" class="cw-btn phone" target="_self" aria-label="Bizi arayın">
    <i class="fa-solid fa-phone"></i>
    <span class="label">Bizi Arayın</span>
  </a>

  <!-- WhatsApp -->
  <a runat="server" id="lnkWhatsapp" class="cw-btn whatsapp" target="_blank" rel="noopener" aria-label="WhatsApp İletişim">
    <i class="fa-brands fa-whatsapp"></i>
    <span class="label">WhatsApp İletişim</span>
  </a>

  <!-- Sizi Arayalım -->
  <a runat="server" id="lnkCallback" class="cw-btn callback" target="_self" aria-label="Sizi arayalım">
    <i class="fa-solid fa-mobile-screen"></i>
    <span class="label">Sizi Arayalım</span>
  </a>
</div>
