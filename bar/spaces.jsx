import Desktop from './lib/Desktop.jsx';
import Error from './lib/Error.jsx';
import parse from './lib/parse.jsx';
import styles from './lib/styles.jsx';

const style = {
  display: 'grid',
  gridAutoFlow: 'column',
  gridGap: '24px',
  position: 'fixed',
  overflow: 'hidden',
  left: '0px',
  top: '0px',
  fontFamily: styles.fontFamily,
  fontSize: styles.fontSize,
  color: styles.colors.dim,
  fontWeight: styles.fontWeight,
};

export const refreshFrequency = false;
export const command = './bar/scripts/spaces.sh';

export const render = ({ output }) => {
  const data = parse(output);
  if (typeof data === 'undefined') return <div></div>;
  return (
    <div style={style}>
      {typeof data.error !== 'undefined' ? (
        <Error msg={`Error: ${data.error}`} side="left" />
      ) : (
        <Desktop output={data} />
      )}
    </div>
  );
};

export default null;
