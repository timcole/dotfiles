import styles from './styles.jsx';
import { run } from 'uebersicht';

const containerStyle = {
  display: 'grid',
  gridAutoFlow: 'column',
  cursor: 'pointer',
  select: 'none',
  background: '#161D26',
  padding: '0 5px',
};

const desktopStyle = {
  textAlign: 'center',
  borderRadius: 50,
  height: '10px',
  width: '10px',
  margin: '6px',
  marginLeft: '6px',
  border: `2px solid ${styles.colors.dim}`,
};

const render = ({ output }) => {
  if (typeof output === 'undefined') return null;

  return (
    <div style={containerStyle}>
      {output.map(({ index, visible }) => {
        let contentStyle = JSON.parse(JSON.stringify(desktopStyle));
        if (visible == 1) contentStyle.background = styles.colors.dim;
        return (
          <div
            style={contentStyle}
            onClick={() => run(`yabai -m window --space ${index}`)}
          ></div>
        );
      })}
    </div>
  );
};

export default render;
