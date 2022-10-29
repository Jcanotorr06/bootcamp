import { NextPage } from "next";
import Button from "../components/Button";
import Art from '../../public/landing_art.svg'
import Link from "../components/Link";

const LandingPage: NextPage = () => {
  return (
    <>
      <header className="section bg-base-white">
        <nav className="flex justify-center items-center py-sm grow">
            <div role="content" className="flex flex-row justify-between items-center gap-sm grow">
                <div className="" role="block" aria-label="logo block">
                    <h2 className="font-bold">Logo</h2>
                </div>
                <nav className="flex flex-row justify-center items-center gap-xxx-big" role="block" aria-label="links block">
                    <Link href="/example" text="Categorias" className="py-sm"/>
                    <Link href="/example" text="Recursos" className="py-sm"/>
                    <Link href="/example" text="Acerca de" className="py-sm"/>
                    <Link href="/example" text="Contacto" className="py-sm"/>
                    <Link href="/example" text="FAQ" className="py-sm"/>
                </nav>
                <div className="flex flex-row justify-center items-center gap-md" role="block" aria-label="actions block">
                    <Button text="Iniciar Sesión" variant="accent" size="lg" theme="primary"/>
                    <Button text="Registrarse" size="lg" theme="primary"/>
                </div>
            </div>
        </nav>
      </header>
      <main className="section">
        <section
          role="hero"
          className="hero"
        >
          <article
            role="container"
            className="flex grow flex-row items-center gap-xxx-big self-stretch"
          >
            <div role="content" className="flex flex-col items-start gap-lg">
              <div role="text" className="flex flex-col gap-xbig ">
                <div
                  role="heading"
                  aria-level={1}
                  className="flex flex-col gap-sm self-stretch"
                >
                  <span className="self-stretch text-ov-lg uppercase text-primary-500">
                    Aprende sin Limites
                  </span>
                  <h1 className="order-1 self-stretch text-d-lg font-extrabold text-neutral-900">
                    Empieza tu Carrera en IT Justo Aquí
                  </h1>
                </div>
                <p className="text-p-lg text-neutral-700">
                  Inicie e impulse su carrera tecnológica rápidamente. ¿Listo
                  para aceptar un trabajo mejor pagado? Sigue leyendo para
                  aprender. Somos Bootcamp Panamá. Nuestra misión es
                  introducirlo en la industria de TI.
                </p>
              </div>
              <div
                role="actions"
                className="flex flex-row items-start gap-md self-stretch">
                    <Button text="Descubre nuestros cursos" size="lg" theme="primary" name="discover" aria-label="discover"/>
                    <Button text="Inscribete gratis" size="lg" theme="primary" variant="accent" name="signup free" aria-label="signup free"/>
              </div>
            </div>
            <div className="self-stretch grow order-1" role="image">
                <Art/>
            </div>
          </article>
        </section>
      </main>
      <footer></footer>
    </>
  );
};

export default LandingPage;
