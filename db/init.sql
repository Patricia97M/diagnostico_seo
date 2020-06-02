-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-03-2020 a las 21:12:48
-- Versión del servidor: 5.6.44
-- Versión de PHP: 7.3.5-1+0~20190503093827.38+stretch~1.gbp60a41b

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `diagbd`
--
CREATE DATABASE IF NOT EXISTS `diagbd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `diagbd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `tipo_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `tipo_estado`) VALUES
(1, 'Bien'),
(2, 'Mal'),
(3, 'No existe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL,
  `nombre_parametro` varchar(100) NOT NULL,
  `valor_optimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_seo`
--

CREATE TABLE `puntos_seo` (
  `id_punto` int(11) NOT NULL,
  `nombre_punto` varchar(100) NOT NULL,
  `descripcion_punto` varchar(500) NOT NULL,
  `recomendacion_punto` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos_seo`
--

INSERT INTO `puntos_seo` (`id_punto`, `nombre_punto`, `descripcion_punto`, `recomendacion_punto`) VALUES
(1, 'Título', 'El título de la página se refiere a una propiedad del código HTML <title>, identificada por medio de la frase que aparece en la pestaña del navegador o en la página de resultados.', 'Debe ser atractivo, contener entre 10 y 70 caracteres, cada página debe tener por separado un título único, en el cual debe incorporar las palabras claves más importantes y relevantes. Además, usar frases como “perfecta” “definitiva” “experto” hace que el contenido sea más llamativo y tentador. Hay que tener siempre presente que tu título no solo determinará el nombre oficial de la página, sino que será la forma en la que los clientes potenciales la encuentren.'),
(2, 'Meta-descripciones', 'Meta Description es un fragmento del código HTML que tiene como función resumir lo que la página aborda. Aparece en la página de resultados como un resumen inmediatamente debajo del título de la página.', 'La meta descripción debe estar presente en todos los apartados de la web, es decir, cada página de la web indexada. Cada etiqueta debe tener un contenido único, explícito y con las palabras clave más relevantes para tu negocio, ya que además de informar acerca de la temática de tu empresa, con esta descripción puedes atraer nuevos clientes potenciales. ¿Cómo? Redactando una meta descripción que funcione como un anuncio. Para ello es aconsejable que sea un texto atractivo, que contenga idealmente entre 70 y 160 caracteres contabilizando espacios en el que incluya llamadas a la acción que garanticen una mayor conversión de clics.'),
(3, 'Encabezados', 'Son las etiquetas <h1>, <h2>, <h3>, etc. que muestran de forma jerárquica los diferentes títulos que pueden encontrarse en un contenido. ', 'Hay varias cosas que hay que tener en cuenta a la hora de incorporar etiquetas de encabezados HTML. La primera de ellas es que el <h1> es el titular que resume el contenido de cada página de tu sitio web, por lo que se aconseja que haya un único <h1> que defina el título principal del texto. Además se recomienda que se complete cada una de ellas con las palabras clave más importantes. Pero cuidado con la extensión, ya que el titular puede ir perdiendo fuerza cuando más largo sea, por lo que es preferible que empiece con las palabras clave principales. Por último, como título que es, hay que darle un lugar destacado en la página, ya que el motor de búsqueda otorga una mayor importancia al contenido situado en el primer tramo de un sitio web.'),
(4, 'Atributo Alt', 'El texto alternativo ‘atributo Alt’ se utiliza para describir las imágenes para dar información a los buscadores y personas con discapacidad visual. Con esta información adicional puedes ayudarles a los buscadores a entender las imágenes, lo que puede mejorar en los resultados de búsqueda de imágenes.', 'El atributo Alt ayuda a los buscadores a reconocer las imágenes que incorporan en las páginas web. Aunque la tecnología ha evolucionado mucho, los motores de búsqueda siguen teniendo problemas para interpretar el contenido de las imágenes. Por ello, el atributo Alt les ayuda a ‘ver’ y a designar una descripción concreta de las mismas, además de ser utilizado por los lectores de pantalla para proporcionar un contexto a las personas con discapacidad Visual. Este atributo además de ser una herramienta muy valiosa a nivel de posicionamiento, también ayuda a generar grandes cantidades de tráfico a su web, ya que este texto permitirá que estas imágenes se muestren en los resultados de Google Images.'),
(5, 'Relación texto/HTML', 'Relación de código a texto, representa el porcentaje de texto real en una página web en comparación con el porcentaje de Código HTML, y es utilizado por los motores de búsqueda para calcular la relevancia de una página web. ', 'Una mayor proporción de código a texto aumentará sus posibilidades de obtener una mejor posición en los resultados de los motores de búsqueda '),
(6, 'URL', 'Dirección de una pagina web, Los motores de búsqueda también exploran en las URL’s en busca de palabras claves.', 'Debe ser descriptiva y que contenga palabras claves que deseadas. Además se debe evitar crear URL’s con códigos o parámetros, tiene que ser amigable, confiable y fácil.'),
(7, 'Enlaces internos', 'Son enlaces que van de una página a otra dentro del mismo dominio. Estos son importantes principalmente porque posibilitan que el lector se mantenga por más tiempo en el dominio y facilita el robot de rastreo web.', 'Hay que tener presente la importancia de relacionar los diferentes apartados de nuestra web mediante enlaces internos. Dichos links constituyen un factor fundamental en la mejora del posicionamiento del sitio, ya que, entre otras funciones, permite a GoogleTM indexar con mayor precisión todos los apartados y favorece la experiencia de navegación de los usuarios haciendo que el tiempo de permanencia de los mismos sea mayor. Para asegurar la eficacia en los enlaces internos es recomendable que utilices palabras clave en los mismos y que configures los apartados de Aviso Legal o Condiciones de Uso para que Google no los indexe, ya que se trata de contenido genérico y no tiene relación directa con la temática de la web.'),
(8, 'Enlaces externos', 'Enlaces externos que proviene de un sitio web o dominio de referencia distinto y apuntan a este. Analizar el link building de la competencia puede darte una idea de cuánto necesitas hacer para mejorar tu clasificación en los motores de búsqueda.', 'Enlazar a otros sitios webs o a fuentes alternativas de información da a los artículos del sitio web una calidad y un valor añadido que se traduce en beneficios palpables para su posicionamiento. Para que tus referencias externas consigan el éxito deseado es recomendable que se haga un uso adecuado de la etiqueta Rel = No Follow a la hora de indexar y que enlaces los post a sitios con la misma temática, que tengan una cierta autoridad y, por supuesto, que sean de interés y relevancia para tus lectores.'),
(9, 'Enlaces rotos', 'Los enlaces rotos envían a los usuarios a páginas web no existentes. Son malos para la usabilidad de su sitio, la reputación y SEO. ', 'Los enlaces rotos que contenga un sitio web pueden arruinar todo, ya que además de dificultar a los rastreadores la indexación de la página, también empeora la usabilidad, la experiencia de usuario y, como consecuencia, la reputación del sitio web. Y es que un enlace roto ‘molesta’ tanto a los motores de búsqueda, como a los usuarios. Por ello, hay que revisar frecuentemente los links y comprobar que todos indexen adecuadamente.'),
(10, 'Autoridad de dominio', 'El domain authority es un indicador que refleja la autoridad del dominio de un sitio web. Este indicador -que se mide de 0 a 100 siendo el 100 la máxima autoridad- equivale a la calidad o credibilidad de un sitio web por parte de los buscadores. Se mide analizando el número de usuarios que la visitan en un periodo de tiempo. Un domain authority alto es esencial para que tu sitio web tenga visibilidad en los buscadores y así el contenido y páginas que publiques.', 'Si tienes un Domain Authority bajo, de entre 10 y 20, será muy difícil que consigas posicionar alguna de tus páginas con alguna keyword específica. Por el contrario si tienes un DA alto, tendrás muchas más posibilidades de posicionar contenido en base a diferentes keywords, lo que se traduce en más visibilidad y una mayor monetización de tu negocio. Algunas recomendación para subir el DA son conseguir enlaces de diferentes dominios con dominio alto, eliminar los link de sitios sospechosos, crear una buena estructura interna de enlaces, actualizar contenido sistemáticamente y utilizar las redes social haciendo posible compartir contenido.'),
(11, 'Velocidad', 'Tiempo de carga del sitio web, la audiencia odia esperar, por lo que si el sitio web tarda en cargarse más de lo debido esto afectará seriamente la tasa de conversión. ', 'La lentitud de las páginas es una de las principales quejas de los usuarios y un factor relevante en la pérdida de posiciones en los resultados de búsqueda. Hay que tener muy presente que la audiencia odia esperar, por lo que si el sitio web tarda en cargarse más de lo debido esto afectará seriamente a tu tasa de conversión. Para solucionar este problema te aconsejamos que revises tus imágenes y archivos, quizá sean demasiado grandes o tengan un peso excesivo, por lo que deberás optimizarlos y reducirlos lo máximo posible.'),
(12, 'Optimización móvil', 'Se entiende por optimización móvil las medidas encaminadas a obtener resultados óptimos en la visualización del contenido web en dispositivos móviles.', 'Google recomienda adaptar una web a móvil mediante el diseño responsive, es decir, se adapta el contenido como textos, imágenes, etc., a las dimensiones del dispositivo móvil. De este modo el contenido se verá correctamente independientemente del tamaño de la pantalla donde se visualiza.'),
(13, 'Robots.txt', 'Un archivo robots.txt le permite restringir el acceso de los robots de los motores de búsqueda que rastrean la web y puede impedir que estos robots accedan a directorios y páginas específicos. También especifica dónde se encuentra el archivo de mapa de sitio XML.', 'El archivo robots es esencial para el posicionamiento web ya que sirve para controlar el acceso de los robots buscadores al sitio web y controlar las páginas que pueden o no visitar. Puede comprobar si su chero robots.txt tiene errores de sintaxis utilizando GoogleTM Search Console (Herramientas para Webmasters de GoogleTM) seleccionando ‘Robots.txt Tester’ en ‘Crawl’. Esto también le permite comprobar páginas individualmente para asegurarse de que Googlebot (el robot de GoogleTM) tiene acceso adecuado.'),
(14, 'Mapa del sitio XML', 'Un sitemap enumera las URL que están disponibles para el rastreo y puede incluir información adicional como las últimas actualizaciones de su sitio, la frecuencia de los cambios y la importancia de las URL. Esto permite a los motores de búsqueda rastrear el sitio de manera más inteligente. ', 'Es recomendable generar un sitemap para el sitio web y añadir sólo las páginas que deseas indexar, por lo que hay que asegurarse de no incluir las que han sido bloqueadas a través del archivo robots.txt. Cerciórate, también, de que ninguna URL causa una redirección o devuelve un código de error. También es una buena práctica especificar la ubicación de su sitemap en su archivo robots.txt. '),
(15, 'Protocolo seguro', 'Los sitios con HTTPS garantiza que cuando un usuario acceda a un sitio web, los datos se cifran mediante el protocolo SSL ‘Secure Sockets Layer’ o la versión más moderna, protocolo TLS ‘Transport Layer Security’ los cuales facilitan las comunicaciones seguras entre dos sistemas.', 'Para ayudar a los usuarios a navegar por sitios web de forma más segura, se marcarán todos los sitios HTTP no cifrados como ‘no seguros’ en la URL del navegador, dándole preferencia en los rankings de búsqueda, por lo que va a demostrar que el uso de HTTPS es importante para tus actividades de SEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `id_resultado` int(11) NOT NULL,
  `fecha_resultado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_url` int(11) NOT NULL,
  `id_punto` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio`
--

CREATE TABLE `sitio` (
  `id_url` int(11) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id_parametro`);

--
-- Indices de la tabla `puntos_seo`
--
ALTER TABLE `puntos_seo`
  ADD PRIMARY KEY (`id_punto`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_url` (`id_url`),
  ADD KEY `id_punto` (`id_punto`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `sitio`
--
ALTER TABLE `sitio`
  ADD PRIMARY KEY (`id_url`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `puntos_seo`
--
ALTER TABLE `puntos_seo`
  MODIFY `id_punto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sitio`
--
ALTER TABLE `sitio`
  MODIFY `id_url` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`id_url`) REFERENCES `sitio` (`id_url`) ON DELETE CASCADE,
  ADD CONSTRAINT `resultado_ibfk_2` FOREIGN KEY (`id_punto`) REFERENCES `puntos_seo` (`id_punto`) ON DELETE CASCADE,
  ADD CONSTRAINT `resultado_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
