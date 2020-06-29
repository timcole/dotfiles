import styles from './styles.jsx';

const render = ({ output }) => {
  let charging = output.charging;
  let percentage = output.percentage;
  if (charging && percentage == 100) return <div></div>;
  return (
    <div
      style={{
        background: '#575d6d',
        paddingLeft: 15,
        paddingRight: 15,
      }}
    >
      <div
        style={
          percentage < 10 && !charging ? { color: styles.colors.red } : null
        }
      >
        <span>
          {charging ? '' : ''} {percentage}%
        </span>
      </div>
    </div>
  );
};

export default render;
