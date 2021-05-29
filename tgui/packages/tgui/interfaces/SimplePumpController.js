import { useBackend } from '../backend';
import { Box, Button, ProgressBar, LabeledList, Section } from '../components';
import { Window } from '../layouts';

// The minimum and maximum value on the progress bar before it overflow.
const MIN_BAR_VALUE = 0;
const MAX_BAR_VALUE = 1013;


/* Definition of pressure threshold. 95 - 110 is considered good. 80 - 95 and 110 - 120 is considered average.
Everything else bad.
*/

const getStatusColor = val => {
  let statusColor = 'good';
  const BAD_LOWER_THRESHOLD = 80;
  const AVG_LOWER_THRESHOLD = 95;
  const AVG_UPPER_THRESHOLD = 110;
  const BAD_UPPER_THRESHOLD = 120;
  if (val < BAD_LOWER_THRESHOLD) {
    statusColor = 'bad';
  } else if (val < AVG_LOWER_THRESHOLD) {
    statusColor = 'average';
  } else if (val > AVG_UPPER_THRESHOLD) {
    statusColor = 'average';
  } else if (val > BAD_UPPER_THRESHOLD) {
    statusColor = 'bad';
  }
  return statusColor;
};

export const SimplePumpController = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    chamber_pressure,
    processing,
  } = data;
  return (
    <Window>
      <Window.Content>
        <Section title="Information">
          <LabeledList>
            <LabeledList.Item label="Chamber Pressure">
              <ProgressBar
                color={getStatusColor(chamber_pressure)}
                value={chamber_pressure}
                minValue={MIN_BAR_VALUE}
                maxValue={MAX_BAR_VALUE}>
                {chamber_pressure} kPa
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Actions">
          <Box>
            <Button
              content={"Prepare For Vacuum"}
              icon={"arrow-circle-left"}
              disabled={processing}
              onClick={() => act("cycle_ext")} />
            <Button
              content={"Stabilize Atmospherics"}
              icon={"arrow-circle-right"}
              disabled={processing}
              onClick={() => act("cycle_int")} />
          </Box>
          <Box>
            <Button
              content={"Abort"}
              icon={"ban"}
              color={"red"}
              disabled={!processing}
              onClick={() => act("abort")} />
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
