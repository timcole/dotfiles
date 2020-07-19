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
        background:
          percentage > 25 ? '#131920' : percentage > 10 ? '#7D6731' : '#7D2F32',
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
