import styles from './styles.jsx';

const render = ({ output }) => {
  let charging = output.charging;
  let percentage = output.percentage;
  if (charging && percentage == 100) return <div></div>;

  let icon = charging
    ? ''
    : percentage > 75
    ? ''
    : percentage > 50
    ? ''
    : percentage > 25
    ? ''
    : percentage > 10
    ? ''
    : '';

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
          percentage <= 10 && !charging ? { color: styles.colors.red } : null
        }
      >
        <span>
          {icon} {percentage}%
        </span>
      </div>
    </div>
  );
};

export default render;
