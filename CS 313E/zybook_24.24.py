FULL_TANK = 14
class FancyCar:
    FULL_TANK = 14.0

    def __init__(self, model="Old Clunker", mpg=24.0):
        self.model = model
        self.mpg = mpg
        self.odometer = 5.0
        self.gas = self.FULL_TANK
        self.engine_on = False

    def check_odometer(self):
        return self.odometer

    def check_gas_gauge(self):
        return self.gas

    def get_model(self):
        return self.model

    def get_mpg(self):
        return self.mpg

    def honk_horn(self):
        print(f"The {self.model} says beep beep!")

    def drive(self, distance):
        if distance <= 0:
            return

        if self.engine_on:
            max_distance = self.gas * self.mpg
            if distance <= max_distance:
                self.odometer += distance
                self.gas -= distance / self.mpg
            else:
                self.odometer += max_distance
                self.gas = 0.0
                self.engine_on = False
        else:
            print("Engine is off. Start the engine first.")

    def add_gas(self, amount):
        if amount > 0:
            if not self.engine_on:
                self.gas = min(self.gas + amount, self.FULL_TANK)
            else:
                print("Engine is on. Stop the engine first.")

    def start_engine(self):
        self.engine_on = True

    def stop_engine(self):
        self.engine_on = False


# Testing the FancyCar class
car = FancyCar()
print(f"Model: {car.get_model()}")
print(f"Miles per Gallon: {car.get_mpg()}")
print(f"Odometer: {car.check_odometer()} miles")
print(f"Gas Gauge: {car.check_gas_gauge()} gallons")

car.honk_horn()
car.start_engine()
car.drive(50)
print(f"Odometer: {car.check_odometer()} miles")
print(f"Gas Gauge: {car.check_gas_gauge()} gallons")

car.drive(30)
print(f"Odometer: {car.check_odometer()} miles")
print(f"Gas Gauge: {car.check_gas_gauge()} gallons")

car.add_gas(10)
print(f"Gas Gauge: {car.check_gas_gauge()} gallons")

car.stop_engine()
car.add_gas(5)