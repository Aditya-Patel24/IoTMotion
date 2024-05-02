import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.io.PrintWriter;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

@WebServlet("/motionServlet")
public class motionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Queue<HttpServletResponse> clients = new ConcurrentLinkedQueue<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");

        // Set CORS headers
        response.setHeader("Access-Control-Allow-Origin", "*"); // For development only; specify origins in production
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Connection", "keep-alive");

        clients.add(response);

        while (!Thread.currentThread().isInterrupted()) {
            try {
                response.getWriter().flush();
                Thread.sleep(1000); // Sleep to limit data flooding
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } catch (IOException e) {
                break; // Assume client disconnected
            }
        }

        clients.remove(response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String motionDetected = request.getParameter("motionDetected");
        System.out.println("Received request: motionDetected=" + motionDetected);

        // Set CORS headers
        response.setHeader("Access-Control-Allow-Origin", "*"); // For development only; specify origins in production

        if ("true".equals(motionDetected)) {
            notifyClients("Motion detected!");
        } else {
            notifyClients("No motion detected.");
        }

        response.getWriter().write("Data received successfully!");
    }

    private void notifyClients(String message) {
        for (HttpServletResponse client : clients) {
            try {
                client.getWriter().write("data: " + message + "\n\n");
                client.getWriter().flush();
            } catch (IOException e) {
                System.out.println("Error sending SSE");
                clients.remove(client);
            }
        }
    }
}
