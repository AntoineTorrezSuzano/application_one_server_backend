echo "Initiating custom port removal tool!"
for port in {6001..6124}; do
    echo "Closing port ${port}/tcp..."¨
    sudo firewall-cmd --permanent --remove-port=${port}/tcp
done
echo "All done! My tool has successfully updated the permanent configuration."