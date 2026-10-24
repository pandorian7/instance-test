# Instance Test Challenge (`cat flag.txt`)

Simple dynamic-flag-accepting CTF challenge container.

## Flag Injection Support
- **Build Time (`BUILD_TIME`)**: Accepts `--build-arg FLAG=<team_flag>` via `ARG FLAG` and writes it to `/app/flag.txt`.
- **Start Time (`START_TIME`)**: Accepts `-e FLAG=<team_flag>` at runtime and writes it to `/app/flag.txt` in `entrypoint.sh`.

## Solving the Challenge
Connect to the assigned instance host and port using netcat (`nc`) and read `flag.txt`:

```bash
nc <host> <port>
cat flag.txt
```
