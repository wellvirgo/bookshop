package vn.dangthehao.bookshop.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.stereotype.Service;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.domain.OrderDetail;

@Service
public class ExportPDFService {

    public void exportDataToPDF(String documentPath, Order order) {
        Document document = new Document();
        document.setPageSize(PageSize.A4);
        document.addLanguage("vn");
        try {
            PdfWriter.getInstance(document, new FileOutputStream(documentPath));
            document.open();

            Paragraph paragraph = new Paragraph("Order's Information");

            // General information order table
            String[] generalInfoOrderTableHeaders = { "Order id", "Receiver's name", "Receiver's address",
                    "Receiver's phone", "Total", "Status" };
            PdfPTable generalInfoOrderTable = new PdfPTable(6);
            addTableHeader(generalInfoOrderTable, generalInfoOrderTableHeaders);
            addRowsForGeneralTable(generalInfoOrderTable, order);

            // Order details table
            String[] orderDetailsTableHeaders = { "Order detail id", "Book id", "Book name", "Quantity", "Price",
                    "Total" };
            PdfPTable orderDetailsTable = new PdfPTable(6);
            addTableHeader(orderDetailsTable, orderDetailsTableHeaders);
            addRowsForDetailsTable(orderDetailsTable, order);

            document.add(paragraph);
            document.add(generalInfoOrderTable);
            document.add(orderDetailsTable);
            document.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    public void addTableHeader(PdfPTable table, String[] headers) {
        Stream.of(headers)
                .forEach(columnTitle -> {
                    PdfPCell header = new PdfPCell();
                    header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                    header.setBorderWidth(2);
                    header.setPhrase(new Phrase(columnTitle));
                    table.addCell(header);
                });
    }

    public void addRowsForGeneralTable(PdfPTable table, Order order) {
        table.addCell(String.valueOf(order.getId()));
        table.addCell(order.getReceiverName());
        table.addCell(order.getReceiverAddress());
        table.addCell(order.getReceiverPhone());
        table.addCell(String.valueOf((int) order.getTotal()));
        table.addCell(order.getStatus());
    }

    public void addRowsForDetailsTable(PdfPTable table, Order order) {
        List<OrderDetail> orderDetails = order.getOrderDetails();
        for (OrderDetail orderDetail : orderDetails) {
            table.addCell(String.valueOf(orderDetail.getId()));
            table.addCell(String.valueOf(orderDetail.getBook().getId()));
            table.addCell(orderDetail.getBook().getName());
            table.addCell(String.valueOf(orderDetail.getQuantity()));
            table.addCell(String.valueOf(orderDetail.getBook().getPrice()));
            table.addCell(String.valueOf((int) orderDetail.getTotal()));
        }
    }

}
