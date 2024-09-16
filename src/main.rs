use wry::application::event::{Event, WindowEvent};
use wry::application::event_loop::{ControlFlow, EventLoop};
use wry::application::window::WindowBuilder;
use wry::webview::WebViewBuilder;
use wry::Result;

fn main() -> Result<()> {
    // Create the event loop
    let event_loop = EventLoop::new();

    // Create the window
    let window = WindowBuilder::new()
        .with_title("Kids A-Z")
        .with_inner_size(wry::application::dpi::LogicalSize::new(1040.0, 820.0))
        .with_position(wry::application::dpi::LogicalPosition::new(0.0, 0.0)) // Set window position
        .build(&event_loop)?;

    // Build the WebView and load the specified URL
    let _webview = WebViewBuilder::new(window)?
        .with_url("https://www.kidsa-z.com/main/Login")?
        .build()?;

    // Run the event loop
    event_loop.run(move |event, _, control_flow| {
        *control_flow = ControlFlow::Wait;

        if let Event::WindowEvent { event, .. } = event {
            if let WindowEvent::CloseRequested = event {
                *control_flow = ControlFlow::Exit;
            }
        }
    });
}