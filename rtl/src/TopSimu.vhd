library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TopSimu is
    port (
        PinARst_N   : in    std_logic;
        PinClk      : in    std_logic;
        PinRx       : in    std_logic;
        PinTx       : out   std_logic
    );
end entity TopSimu;

architecture rtl of TopSimu is
    component Simu is
        generic (
            C_Freq          : integer := 50_000_000
        );
        port (
            ARst            : in    std_logic := '0';
            Clk             : in    std_logic;
            SRst            : in    std_logic := '0';
            AnemoOut        : out   std_logic;
            GiroPwm         : out   std_logic;
            CapPwm          : out   std_logic;
            VerinPwm        : in    std_logic;
            VerinSens       : in    std_logic;
            VerinAngleSck   : in    std_logic;
            VerinAngleMiso  : out   std_logic;
            VerinAngleCs_N  : in    std_logic;
            BtnBabord       : out   std_logic;
            BtnTribord      : out   std_logic;
            BtnStandby      : out   std_logic;
            LedBabord       : in    std_logic;
            LedTribord      : in    std_logic;
            LedStandby      : in    std_logic;
            Rx              : in    std_logic;
            Tx              : out   std_logic
        );
    end component;
    signal ARst     : std_logic;
    signal Clk      : std_logic;
begin
    ARst <= not PinARst_N;
    Clk <= PinClk;
    uSimu : Simu
        generic map (
            C_Freq          => 50e6)  -- Spécifier la fréquence de Clk
                                      -- Sur le GUI du simulateur choisir le baudrate de 1 000 000 bauds
        port map (
            ARst            => ARst,    Clk             => Clk,     SRst            => '0',
            AnemoOut        => open,    GiroPwm         => open,    CapPwm          => open,
            VerinPwm        => '0',     VerinSens       => '0',
            VerinAngleSck   => '0',     VerinAngleMiso  => open,    VerinAngleCs_N  => '1',
            BtnBabord       => open,    BtnTribord      => open,    BtnStandby      => open,
            LedBabord       => '0',     LedTribord      => '0',     LedStandby      => '0',
            Rx              => PinRx, Tx => PinTx);
    
end architecture rtl;