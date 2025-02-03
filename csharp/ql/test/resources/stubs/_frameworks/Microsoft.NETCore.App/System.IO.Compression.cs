// This file contains auto-generated code.
// Generated from `System.IO.Compression, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
namespace System
{
    namespace IO
    {
        namespace Compression
        {
            public enum CompressionLevel
            {
                Optimal = 0,
                Fastest = 1,
                NoCompression = 2,
                SmallestSize = 3,
            }
            public enum CompressionMode
            {
                Decompress = 0,
                Compress = 1,
            }
            public class DeflateStream : System.IO.Stream
            {
                public System.IO.Stream BaseStream { get => throw null; }
                public override System.IAsyncResult BeginRead(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override System.IAsyncResult BeginWrite(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override bool CanRead { get => throw null; }
                public override bool CanSeek { get => throw null; }
                public override bool CanWrite { get => throw null; }
                public override void CopyTo(System.IO.Stream destination, int bufferSize) => throw null;
                public override System.Threading.Tasks.Task CopyToAsync(System.IO.Stream destination, int bufferSize, System.Threading.CancellationToken cancellationToken) => throw null;
                public DeflateStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel) => throw null;
                public DeflateStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel, bool leaveOpen) => throw null;
                public DeflateStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode) => throw null;
                public DeflateStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode, bool leaveOpen) => throw null;
                public DeflateStream(System.IO.Stream stream, System.IO.Compression.ZLibCompressionOptions compressionOptions, bool leaveOpen = default(bool)) => throw null;
                protected override void Dispose(bool disposing) => throw null;
                public override System.Threading.Tasks.ValueTask DisposeAsync() => throw null;
                public override int EndRead(System.IAsyncResult asyncResult) => throw null;
                public override void EndWrite(System.IAsyncResult asyncResult) => throw null;
                public override void Flush() => throw null;
                public override System.Threading.Tasks.Task FlushAsync(System.Threading.CancellationToken cancellationToken) => throw null;
                public override long Length { get => throw null; }
                public override long Position { get => throw null; set { } }
                public override int Read(byte[] buffer, int offset, int count) => throw null;
                public override int Read(System.Span<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task<int> ReadAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask<int> ReadAsync(System.Memory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override int ReadByte() => throw null;
                public override long Seek(long offset, System.IO.SeekOrigin origin) => throw null;
                public override void SetLength(long value) => throw null;
                public override void Write(byte[] buffer, int offset, int count) => throw null;
                public override void Write(System.ReadOnlySpan<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task WriteAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask WriteAsync(System.ReadOnlyMemory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override void WriteByte(byte value) => throw null;
            }
            public class GZipStream : System.IO.Stream
            {
                public System.IO.Stream BaseStream { get => throw null; }
                public override System.IAsyncResult BeginRead(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override System.IAsyncResult BeginWrite(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override bool CanRead { get => throw null; }
                public override bool CanSeek { get => throw null; }
                public override bool CanWrite { get => throw null; }
                public override void CopyTo(System.IO.Stream destination, int bufferSize) => throw null;
                public override System.Threading.Tasks.Task CopyToAsync(System.IO.Stream destination, int bufferSize, System.Threading.CancellationToken cancellationToken) => throw null;
                public GZipStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel) => throw null;
                public GZipStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel, bool leaveOpen) => throw null;
                public GZipStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode) => throw null;
                public GZipStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode, bool leaveOpen) => throw null;
                public GZipStream(System.IO.Stream stream, System.IO.Compression.ZLibCompressionOptions compressionOptions, bool leaveOpen = default(bool)) => throw null;
                protected override void Dispose(bool disposing) => throw null;
                public override System.Threading.Tasks.ValueTask DisposeAsync() => throw null;
                public override int EndRead(System.IAsyncResult asyncResult) => throw null;
                public override void EndWrite(System.IAsyncResult asyncResult) => throw null;
                public override void Flush() => throw null;
                public override System.Threading.Tasks.Task FlushAsync(System.Threading.CancellationToken cancellationToken) => throw null;
                public override long Length { get => throw null; }
                public override long Position { get => throw null; set { } }
                public override int Read(byte[] buffer, int offset, int count) => throw null;
                public override int Read(System.Span<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task<int> ReadAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask<int> ReadAsync(System.Memory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override int ReadByte() => throw null;
                public override long Seek(long offset, System.IO.SeekOrigin origin) => throw null;
                public override void SetLength(long value) => throw null;
                public override void Write(byte[] buffer, int offset, int count) => throw null;
                public override void Write(System.ReadOnlySpan<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task WriteAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask WriteAsync(System.ReadOnlyMemory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override void WriteByte(byte value) => throw null;
            }
            public class ZipArchive : System.IDisposable
            {
                public string Comment { get => throw null; set { } }
                public System.IO.Compression.ZipArchiveEntry CreateEntry(string entryName) => throw null;
                public System.IO.Compression.ZipArchiveEntry CreateEntry(string entryName, System.IO.Compression.CompressionLevel compressionLevel) => throw null;
                public ZipArchive(System.IO.Stream stream) => throw null;
                public ZipArchive(System.IO.Stream stream, System.IO.Compression.ZipArchiveMode mode) => throw null;
                public ZipArchive(System.IO.Stream stream, System.IO.Compression.ZipArchiveMode mode, bool leaveOpen) => throw null;
                public ZipArchive(System.IO.Stream stream, System.IO.Compression.ZipArchiveMode mode, bool leaveOpen, System.Text.Encoding entryNameEncoding) => throw null;
                public void Dispose() => throw null;
                protected virtual void Dispose(bool disposing) => throw null;
                public System.Collections.ObjectModel.ReadOnlyCollection<System.IO.Compression.ZipArchiveEntry> Entries { get => throw null; }
                public System.IO.Compression.ZipArchiveEntry GetEntry(string entryName) => throw null;
                public System.IO.Compression.ZipArchiveMode Mode { get => throw null; }
            }
            public class ZipArchiveEntry
            {
                public System.IO.Compression.ZipArchive Archive { get => throw null; }
                public string Comment { get => throw null; set { } }
                public long CompressedLength { get => throw null; }
                public uint Crc32 { get => throw null; }
                public void Delete() => throw null;
                public int ExternalAttributes { get => throw null; set { } }
                public string FullName { get => throw null; }
                public bool IsEncrypted { get => throw null; }
                public System.DateTimeOffset LastWriteTime { get => throw null; set { } }
                public long Length { get => throw null; }
                public string Name { get => throw null; }
                public System.IO.Stream Open() => throw null;
                public override string ToString() => throw null;
            }
            public enum ZipArchiveMode
            {
                Read = 0,
                Create = 1,
                Update = 2,
            }
            public sealed class ZLibCompressionOptions
            {
                public int CompressionLevel { get => throw null; set { } }
                public System.IO.Compression.ZLibCompressionStrategy CompressionStrategy { get => throw null; set { } }
                public ZLibCompressionOptions() => throw null;
            }
            public enum ZLibCompressionStrategy
            {
                Default = 0,
                Filtered = 1,
                HuffmanOnly = 2,
                RunLengthEncoding = 3,
                Fixed = 4,
            }
            public sealed class ZLibStream : System.IO.Stream
            {
                public System.IO.Stream BaseStream { get => throw null; }
                public override System.IAsyncResult BeginRead(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override System.IAsyncResult BeginWrite(byte[] buffer, int offset, int count, System.AsyncCallback asyncCallback, object asyncState) => throw null;
                public override bool CanRead { get => throw null; }
                public override bool CanSeek { get => throw null; }
                public override bool CanWrite { get => throw null; }
                public override void CopyTo(System.IO.Stream destination, int bufferSize) => throw null;
                public override System.Threading.Tasks.Task CopyToAsync(System.IO.Stream destination, int bufferSize, System.Threading.CancellationToken cancellationToken) => throw null;
                public ZLibStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel) => throw null;
                public ZLibStream(System.IO.Stream stream, System.IO.Compression.CompressionLevel compressionLevel, bool leaveOpen) => throw null;
                public ZLibStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode) => throw null;
                public ZLibStream(System.IO.Stream stream, System.IO.Compression.CompressionMode mode, bool leaveOpen) => throw null;
                public ZLibStream(System.IO.Stream stream, System.IO.Compression.ZLibCompressionOptions compressionOptions, bool leaveOpen = default(bool)) => throw null;
                protected override void Dispose(bool disposing) => throw null;
                public override System.Threading.Tasks.ValueTask DisposeAsync() => throw null;
                public override int EndRead(System.IAsyncResult asyncResult) => throw null;
                public override void EndWrite(System.IAsyncResult asyncResult) => throw null;
                public override void Flush() => throw null;
                public override System.Threading.Tasks.Task FlushAsync(System.Threading.CancellationToken cancellationToken) => throw null;
                public override long Length { get => throw null; }
                public override long Position { get => throw null; set { } }
                public override int Read(byte[] buffer, int offset, int count) => throw null;
                public override int Read(System.Span<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task<int> ReadAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask<int> ReadAsync(System.Memory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override int ReadByte() => throw null;
                public override long Seek(long offset, System.IO.SeekOrigin origin) => throw null;
                public override void SetLength(long value) => throw null;
                public override void Write(byte[] buffer, int offset, int count) => throw null;
                public override void Write(System.ReadOnlySpan<byte> buffer) => throw null;
                public override System.Threading.Tasks.Task WriteAsync(byte[] buffer, int offset, int count, System.Threading.CancellationToken cancellationToken) => throw null;
                public override System.Threading.Tasks.ValueTask WriteAsync(System.ReadOnlyMemory<byte> buffer, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken)) => throw null;
                public override void WriteByte(byte value) => throw null;
            }
        }
    }
}
