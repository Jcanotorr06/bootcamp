// src/pages/_app.tsx
import "../styles/main.scss";
import { SessionProvider } from "next-auth/react";
import type { Session } from "next-auth";
import type { AppType } from "next/app";
import { trpc } from "../utils/trpc";
import { DefaultSeo } from "next-seo";

const MyApp: AppType<{ session: Session | null }> = ({
  Component,
  pageProps: { session, ...pageProps },
}) => {
  return (
    <SessionProvider session={session}>
      <DefaultSeo
        title="Bootcamp Panamá"
        description="Inicie e impulse su carrera tecnológica rápidamente. ¿Listo para aceptar un trabajo mejor pagado? Sigue leyendo para aprender.
Somos Bootcamp Panamá. Nuestra misión es introducirlo en la industria de TI."
        themeColor="#FFFFFF"
      />
      <Component {...pageProps} />
    </SessionProvider>
  );
};

export default trpc.withTRPC(MyApp);
