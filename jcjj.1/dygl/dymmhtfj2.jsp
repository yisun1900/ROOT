<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
	String jc_mmydd_khxm=null;
	String jc_mmydd_jhazsj=null;
	Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
	try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,fwdz,lxfs,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj";
	    ls_sql+=" from  jc_mmydd";
		ls_sql+=" where yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_jhazsj=jc_mmydd_jhazsj.substring(0,10);
		 }
	     rs.close();
	     ps.close();

       }
      catch (Exception e) {
	      out.print("Exception: " + e);
	      return;
      }
     finally 
    {
	   try{
		    if (rs != null) rs.close(); 
		    if (ps != null) ps.close(); 
		    if (conn != null) cf.close(conn); 
	      }
	     catch (Exception e){
		     if (conn != null) cf.close(conn); 
	     }
      }
%>

<html>
<head>
<title>�����ڴ�Ҿ�/�ڹ��Ŷ�����ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td width="34%"> 
    <div align="left">������ </div></td>
  </tr>
  <tr align="right"> 
    <td><div align="center"><strong>Ԫ �� ľ �� ȷ �� ��</strong></div></td>
  </tr>
  <tr> 
    <td><table width="100%" border="0">
      <tr>
        <td width="280" scope="row">�ͻ�������<%=jc_mmydd_khxm%></td>
        <td width="265" scope="row"> <div align="left"> ���湤����¼��</div></td>
        <td width="200">��װ���ڣ�<%=jc_mmydd_jhazsj%></td>
      </tr>
    </table>
  <table width="100%" border="0">
              <tr>
                <td width="45%" scope="row"><div align="left"><strong>ľ��Ʒ���� </strong></div></td>
                <td width="55%"><strong> ���С�ƣ�</strong></td>
              </tr>
          </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="4%">¥��</td>
	<td  width="5%">��ʽ/���</td>
	<td  width="8%">��ɫ</td>
	<td  width="5%">��װλ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">����</td>
	<td  width="5%">˫��</td>
	<td  width="5%">�ز�����</td>
	<td  width="5%">�زĺ��</td>
	<td  width="7%">�Ŷ����</td>
	<td  width="4%">��λ</td>
	<td  width="7%">���</td>
	<td  width="10%">��������</td>
</tr>
<%

	ls_sql="SELECT '','',jc_mmydmx.mmxh,mmczmc,azwzmc,kqfxmc,'','', dczlmc,dczlmc,'','',mmhtje,jc_blbj.blxh ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmydmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm ,jc_mmydd ";
    ls_sql+=" where jc_mmydmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmydmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmydmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmydmx.czbm=dm_czbm.czbm(+) and jc_mmydmx.ysbm=jdm_mmczbm.mmczbm";
	ls_sql+=" and jc_mmydmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmydmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmydmx.blxhbm=jc_blbj.blxhbm(+)";
    ls_sql+=" and  jc_mmydmx.mlx=jdm_mlx.mlx(+) and jc_mmydmx.yddbh='"+yddbh+"' and jc_mmydd.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmydmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printSum();
	pageObj.printFoot();

%>          
          <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <th width="333" scope="row"><div align="left">����ಿ�� </div></th>
                    <td width="422"><strong>���С�ƣ�</strong></td>
                  </tr>
               
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="8%">����</td>
	<td  width="8%">Ʒ��</td>
	<td  width="8%">�ͺ�</td>
	<td  width="5%">��λ</td>
	<td  width="8%">����</td>
	<td  width="8%">�� ��</td>

</tr>
<%

	ls_sql="SELECT '',wjjbm,xh,xinghao,sl,dj ,sl*dj";
	ls_sql+=" FROM jc_wjjddmx ";
    ls_sql+=" where  jc_wjjddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_wjjddmx.yddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>
</td>
        </tr>
        <tr>
          <td>�ۼƽ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ����ң�Сд��</td>
        </tr>
        <tr>
          <td>�ѽ�����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ����ң�Сд��</td>
        </tr>
        <tr>
          <td>ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ����ң�Сд��</td>
        </tr>
        <tr>
          <td>����д��&nbsp;&nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp;&nbsp;&nbsp;Ǫ &nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;Ԫ��</td>
        </tr>
        <tr>
          <td> ��ע��</td>
        </tr>
        <tr>
          <td> ������ʾ�������������Ǹ���ľ�ذ壬1.5m��Χ�ڵ�������2--3mm������Ե��������ƽ����</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
 
          <td width="204">�ͻ�ǩ�֣�</td>
          <td width="115">&nbsp;</td>
          <td width="388">�����ˣ�</td>
        </tr>
        <tr>
  
          <td>ǩ�����ڣ�<%=cf.today()%></td>
          <td>&nbsp;</td>
          <td>ǩ�����ڣ�<%=cf.today()%></td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
