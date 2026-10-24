# Instance Test Challenge (SSH + `cat flag.txt`)

Simple dynamic-flag-accepting CTF challenge container with SSH access.

## Credentials
- **Username**: `ctf` (password: `ctf`) or `admin` (password: `admin`)
- **Exposed Container Port**: `22`

## Flag Injection Support
- **Build Time (`BUILD_TIME`)**: Accepts `--build-arg FLAG=<team_flag>` via `ARG FLAG` and writes it to `~/flag.txt`.
- **Start Time (`START_TIME`)**: Accepts `-e FLAG=<team_flag>` at runtime and writes it to `~/flag.txt` in `entrypoint.sh`.

## Solving the Challenge
Connect to the assigned instance host and port over SSH and read `flag.txt`:

```bash
ssh ctf@<host> -p <port>
cat flag.txt
```
