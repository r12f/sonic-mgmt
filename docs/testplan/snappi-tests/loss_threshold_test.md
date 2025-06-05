# SONiC Switch Loss Threshold Test

- [SONiC Switch Loss Threshold Test](#sonic-switch-loss-threshold-test)
  - [Test Objective](#test-objective)
  - [Test Setup](#test-setup)
  - [Test Steps](#test-steps)
  - [Metrics Processing](#metrics-processing)

## Test Objective

This test aims to determine the maximum traffic rate that results in 0% packet loss across different packet sizes. By identifying this threshold, we can assess the switch’s forwarding capability and validate its performance under various traffic conditions.

## Test topology

The test is designed to be topology-agnostic. It does not rely on or impose a fixed topology, wiring, or device configuration.

To achieve this, we follow the Network Under Test testbed design for the testbed setup. And before running the tests, the tests will read the port configurations on the devices under test and configure the traffic generator accordingly to send the traffic.

For more details, please refer to the Network Under Test testbed setup design doc.

### Traffic setup

This test will use all available ports on the traffic generator defined in the testbed to run the test in order to generate the maximum volume of traffic to stress the devices.

The traffic will be configured as bidirectional all to all.

## Test parameters 



## Test Steps

1. Set packet size to 8192 bytes and begin testing. Start with 100% of the line rate and check for packet loss. If any traffic flow experiences packet loss, reduce the traffic rate to 10% of the line rate and test again. Continue adjusting the traffic rate using a binary search approach to determine the maximum rate at which 0% packet loss is observed.
2. Repeat step 3 for packet sizes of 86 bytes, 1536 bytes, and 4096 bytes.
3. For each of the above results, save the percentile figures to a database via the telemetry interface provided by the SONiC team. An example of how to use the interface is provided in telemetry folder.

## Metrics Processing

The traffic loss threshold is evaluated once per switch and is reported by FinalMetricsReporter. For more details, refer to `test_reporting/telemetry/README.md`.

| User Interface Label                     | Label Key in DB          | Example Value       |
| -————————————— | ———————— | -—————— |
| `METRIC_LABEL_DEVICE_ID`                 | device.id                | switch-A            |
| `METRIC_LABEL_DEVICE_TG_FRAME_BYTES`     | tg.frame_bytes           | 4096                |

| User Interface Metric Name               | Metric Name in DB        | Example Value       |
| -————————————— | ———————— | -—————— |
| `METRIC_NAME_NO_LOSS_MAX_RATE`           | no_loss_max_rate         | 59                  |
