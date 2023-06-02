import dis
import marshal


def generate_bytecode_from_pyc(pyc_file_path):
    with open(pyc_file_path, 'rb') as pyc_file:
        _magic = pyc_file.read(4)
        _timestamp = pyc_file.read(4)
        code_object = marshal.load(pyc_file)
        bytecode = dis.Bytecode(code_object)

        bytecode_str = '\n'.join(str(instr) for instr in bytecode)

        return bytecode_str


# Example usage
pyc_file_path = 'example.pyc'
bytecode = generate_bytecode_from_pyc(pyc_file_path)
print(bytecode)
