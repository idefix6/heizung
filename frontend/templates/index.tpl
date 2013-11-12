<html>
<head>
    <title>Heizung</title>
    <meta name="robots" content="noindex">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/css/jquery-ui.css" type="text/css">
    <link rel="stylesheet" href="/css/styles.css" type="text/css">
</head>
<body>
    <script type="text/javascript" src="/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="/js/jquery.jeditable.mini.js"></script>
    <script type="text/javascript" src="/js/general.js">
    </script>
    
    <!-- Date and Time Selector -->
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Overview</a></li>
            <li><a href="#tabs-2">Heating</a></li>
            <li><a href="#tabs-3">Cooling</a></li>
            <li><a href="#tabs-4">Hot Water</a></li>
        </ul>
        <div id="tabs-1">
            <div id="diagram">
            <img src="/img/thome.gif" class="picture" id="home"><br>
            
            <!-- Temperatures -->
            <div id="OutdoorTemp"><span id="description_short"></span><span class="value blackText" id="OutdoorTemp"></span></div><br>
            <div id="OutdoorTemp1h"><span id="description_short"></span><span class="value blackText" id="OutdoorTemp1h"></span></div><br>
            <div id="OutdoorTemp24h"><span id="description_short"></span><span class="value blackText" id="OutdoorTemp24h"></span></div><br>
            
            <div id="RoomTempNominal"><span id="description_short"></span><span class="value redText edit" id="RoomTempNominal"></span></div><br>
            <div id="RoomTemp"><span id="description_short"></span><span class="value blackText" id="RoomTemp"></span></div><br>
            <div id="RoomTemp1h"><span id="description_short"></span><span class="value blackText" id="RoomTemp1h"></span></div><br>
            
            <!-- General -->
            <div id="RTCDate"><span id="description"></span><span class="value blackText" id="RTCDate"></div><br>
            <div id="RTCTime"><span id="description"></span><span class="value blackText" id="RTCTime"></div><br>
            <div id="FirmwareVersion"><span id="description_short"></span><span class="value blackText" id="FirmwareVersion"></div><br>
            <div id="FirmwareDate"><span id="description_short"></span><span class="value blackText" id="FirmwareDate"></div><br>

            <!--  Consumption -->
            <div class="blackText" id="Pelectric"><span id="description"></span><span id="Pelectric"></div><br>
            <div class="blackText" id="Pthermal"><span id="description"></span><span id="Pthermal"></div><br>
            <div class="blackText" id="COP"><span id="description"></span><span id="COP"></div><br>

            <img src="img/ds_std.gif" class="picture" id="background"><br>
            <!-- Heatsource -->
            <div id="HeatSourceIn"><span class="value redText" id="HeatSourceIn"></span></div><br>
            <div id="HeatSourceOut"><span class="value blueText" id="HeatSourceOut"></span></div><br>
            <div id="iconPumpHeatSource"><img alt="" src="/img/pump_90rgb.ico"></div><br>
            <!-- Condensator -->
            <div id="CondensationTemp"><span class="value redText" id="CondensationTemp"></span></div><br>
            <div id="CondensationPress"><span class="value redText" id="CondensationPress"></span></div><br>
            <!-- Middle -->
            <div id="SunctionGasTemp"><span class="value blackText" id="SunctionGasTemp"></span></div><br>
            <div id="OHCompressor1"><span class="value blackText" id="OHCompressor1"></span></div><br>
            <div id="iconCompressor1"><img alt="" src="/img/refrig_0rgb.ico"></div><br>
            <div id="iconMagnetValve"><img alt="" src="/img/valve_magn_0rgb.ico"></div><br>
            <!-- Evaporator -->
            <div id="EvaporationTemp"><span class="value blueText" id="EvaporationTemp"></span></div><br>
            <div id="EvaporationPress"><span class="value blueText" id="EvaporationPress"></span></div><br>
            <!-- HeatTarget -->
            <div id="FlowTemp"><span class="value redText" id="FlowTemp"></span></div><br>
            <div id="HeatReturnTemp2"><span class="value blueText" id="HeatReturnTemp2"></span></div><br>
            <div id="iconPumpHeating"><img alt="" src="/img/pump_180rgb.ico"></div><br>
        </div>
        </div>
        <div id="tabs-2">
            <div id="heating">
                <!-- Heating -->
                <div id="HeatOff"><span id="description"></span><span class="blackText value edit" id="HeatOff"></span></div><br>
                <div id="HeatTimeOn"><span id="description"></span><span class="blackText value edit" id="HeatTimeOn"></span></div><br>
                <div id="HeatTimeOff"><span id="description"></span><span class="blackText value edit" id="HeatTimeOff"></span></div><br>
                <div id="HeatCharacteristicSetPoint"><span id="description"></span><span class="blackText value edit" id="HeatCharacteristicSetPoint"></span></div><br>
                <div id="HeatCharacteristicSetPointBaseTemp"><span id="description"></span><span class="blackText value edit" id="HeatCharacteristicSetPointBaseTemp"></span></div><br>
                <div id="HeatCharacteristicGradient"><span id="description"></span><span class="blackText value edit" id="HeatCharacteristicGradient"></span></div><br>
                <div id="HeatCharacteristicLimit"><span id="description"></span><span class="blackText value edit" id="HeatCharacteristicLimit"></div><br>
                <div id="HeatReturnTemp"><span id="description"></span><span class="blackText value" id="HeatReturnTemp"></div><br>
                <div id="HeatReturnTempNominal"><span id="description"></span><span class="blackText value" id="HeatReturnTempNominal"></div><br>
                <div id="HeatTempHyst"><span id="description"></span><span class="blackText value edit" id="HeatTempHyst"></div><br>
                <div id="RoomTempNominal"><span id="description"></span><span class="blackText value edit" id="RoomTempNominal"></span></div><br>
                <div id="RoomTempFactor"><span id="description"></span><span class="blackText value edit" id="RoomTempFactor"></span></div><br>
                <div id="HeatIncreaseOff"><span id="description"></span><span class="blackText value edit" id="HeatIncreaseOff"></span></div><br>
                <div id="HeatIncreaseTimeOn"><span id="description"></span><span class="blackText value edit" id="HeatIncreaseTimeOn"></span></div><br>
                <div id="HeatIncreaseTimeOff"><span id="description"></span><span class="blackText value edit" id="HeatIncreaseTimeOff"></span></div><br>
                <div id="HeatIncreaseSetPtOffset"><span id="description"></span><span class="blackText value edit" id="HeatIncreaseSetPtOffset"></span></div><br>
                <div id="AuxilaryModeHeating"><span id="description"></span><span class="blackText value" id="AuxilaryModeHeating"></span></div><br>
                <div id="AuxilaryMaxDifference"><span id="description"></span><span class="blackText value" id="AuxilaryMaxDifference"></span></div><br>
            </div>
        </div>
        <div id="tabs-3">
            <div id="cooling">
                <!-- Cooling -->
                <div id="CoolOff"><span id="description"></span><span class="blackText value edit" id="CoolOff"></span></div><br>
                <div id="CoolTimeOn"><span id="description"></span><span class="blackText value edit" id="CoolTimeOn"></span></div><br>
                <div id="CoolTimeOff"><span id="description"></span><span class="blackText value edit" id="CoolTimeOff"></span></div><br>
                <div id="CoolCharacteristicSetPoint"><span id="description"></span><span class="blackText value edit" id="CoolCharacteristicSetPoint"></span></div><br>
                <div id="CoolReturnTemp"><span id="description"></span><span class="blackText value" id="CoolReturnTemp"></span></div><br>
                <div id="CoolReturnTempNominal"><span id="description"></span><span class="blackText value edit" id="CoolReturnTempNominal"></span></div><br>
                <div id="CoolReturnTempHyst"><span id="description"></span><span class="blackText value edit" id="CoolReturnTempHyst"></div><br>
            </div>
        </div>
        <div id="tabs-4">
            <div id="hotwater">
                <!-- Hot Water -->
                <div id="DomesticWaterOff"><span id="description"></span><span class="blackText value edit" id="DomesticWaterOff"></span></div><br>
                <div id="DomesticWaterTimeOn"><span id="description"></span><span class="blackText value edit" id="DomesticWaterTimeOn"></span></div><br>
                <div id="DomesticWaterTimeOff"><span id="description"></span><span class="blackText value edit" id="DomesticWaterTimeOff"></span></div><br>
                <div id="DomesticWaterTempActual"><span id="description"></span><span class="blackText value" id="DomesticWaterTempActual"></span></div><br>
                <div id="DomesticWaterTempNominal"><span id="description"></span><span class="blackText value edit" id="DomesticWaterTempNominal"></span></div><br>
                <div id="DomesticWaterTempHyst"><span id="description"></span><span class="blackText value edit" id="DomesticWaterTempHyst"></span></div><br>
                <div id="LegionellaSchedule"><span id="description"></span><span class="blackText value edit" id="LegionellaSchedule"></div><br>
                <div id="LegionellaTimeOn"><span id="description"></span><span class="blackText value edit" id="LegionellaTimeOn"></div><br>
                <div id="LegionellaTimeOff"><span id="description"></span><span class="blackText value edit" id="LegionellaTimeOff"></div><br>
                <div id="LegionellaTempNominal"><span id="description"></span><span class="blackText value edit" id="LegionellaTempNominal"></div><br>
                <div id="DWNumberOfCompressors"><span id="description"></span><span class="blackText value" id="DWNumberOfCompressors"></div><br>
                <div id="DomesticWaterTimeDelayOnSolar"><span id="description"></span><span class="blackText value" id="DomesticWaterTimeDelayOnSolar"></div><br>
            </div>
        </div>
    </div>
    <div id="overview">
        <div id="dateTimeField"><span id="description">Date/Time</span><span><input type="text" id="dateTimePicker"></span></div><br>
        <br>
        <!-- Status and Values -->
        <div id="iconCooling"><img alt="" src="/img/cool_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="CoolReturnTempNominal"><span class="edit" id="CoolReturnTempNominal"></span></div><br>
        <div class="value blackText" id="CoolReturnTemp"><span id="CoolReturnTemp"></span></div><br>

        <div id="iconHeating"><img alt="" src="/img/heat_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="HeatReturnTempNominal"><span class="" id="HeatReturnTempNominal"></span></div><br>
        <div class="value blackText" id="HeatReturnTemp"><span id="HeatReturnTemp"></span></div><br>

        <div id="iconDomesticWater"><img alt="" src="/img/hw_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="DomesticWaterTempNominal"><span class="edit" id="DomesticWaterTempNominal"></span></div><br>
        <div class="value blackText" id="DomesticWaterTempActual"><span id="DomesticWaterTempActual"></span></div><br>

        <div id="iconPool"><img alt="" src="/img/pool_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="PoolTempNominal"><span class="edit" id="PoolTempNominal"></span></div><br>
        <div class="value blackText" id="PoolTempActual"><span id="PoolTempActual"></span></div><br>

        <div id="iconSolar"><img alt="" src="/img/solar_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="SolarTempNominalMin"><span class="edit" id="SolarTempNominalMin"></span></div><br>
        <div class="value blackText" id="SolarTempActual"><span id="SolarTempActual"></span></div><br>

        <div id="icon3way"><img alt="" src="/img/3way_32x32_inactive.ico"></div><br>
        <div class="value targetText" id="HeatingCircuitNominal"><span class="edit" id="HeatingCircuitNominal"></span></div><br>
        <div class="value blackText" id="HeatingCircuitTemp"><span id="HeatingCircuitTemp"></span></div><br>
    </div>
    </body>
</html>