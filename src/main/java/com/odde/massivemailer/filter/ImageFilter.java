package com.odde.massivemailer.filter;

import com.odde.massivemailer.model.NotificationDetail;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter("/resources/images/*")
public class ImageFilter implements Filter {
    static final String TOKEN = "token";

    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws java.io.IOException, ServletException {
        String token = request.getParameter(TOKEN);

        if (token != null) {
            NotificationDetail nd = NotificationDetail.findById(Integer.parseInt(token));
            nd.updateViewCount();
        }

        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}
