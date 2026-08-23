import type { Metadata } from "next";
import Script from "next/script";
import "./globals.css";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
export const metadata: Metadata={title:"Zombies: Complete Series",description:"Overwatch Workshop zombie survival gamemode."};
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="en"><body><Navbar/>{children}<Footer/><Script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6378602151835312" crossOrigin="anonymous" strategy="afterInteractive" /></body></html>}
