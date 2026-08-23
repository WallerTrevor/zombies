import type { Metadata } from "next";
import type { ReactNode } from "react";
import Script from "next/script";
import "./globals.css";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export const metadata: Metadata = {
  metadataBase: new URL("https://owzombies.com"),

  title: {
    default: "Zombies: Complete Series",
    template: "%s | Zombies: Complete Series",
  },

  description: "Overwatch Workshop zombie survival gamemode.",

  openGraph: {
  title: "Zombies: Complete Series",
  description: "Overwatch Workshop zombie survival gamemode.",
  url: "https://owzombies.com",
  siteName: "Zombies: Complete Series",
  type: "website",
  images: [
    {
      url: "https://owzombies.com/social-preview.png",
      width: 1200,
      height: 630,
      alt: "Zombies: Complete Series",
    },
  ],
},

twitter: {
  card: "summary_large_image",
  title: "Zombies: Complete Series",
  description: "Overwatch Workshop zombie survival gamemode.",
  images: ["https://owzombies.com/social-preview.png"],
},
};

export default function RootLayout({
  children,
}: {
  children: ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <Navbar />

        {children}

        <Footer />

        <Script
          async
          src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6378602151835312"
          crossOrigin="anonymous"
          strategy="afterInteractive"
        />
      </body>
    </html>
  );
}