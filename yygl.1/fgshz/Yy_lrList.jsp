<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	<%
	String yy_lr_fgs=null;
	String yy_lrglf_ysbl=null;
	String yy_lrglf_sjsq=null;
	double i=0;
	String yy_lrsj_ysbl=null;
	String yy_lrsj_sjsq=null;
	double j=0;
	String yy_lrgc_qnpj=null;
	String yy_lrgc_bzzs=null;
	double k=0;
	String yy_lrzc_qnpj=null;
	String yy_lrzc_bzzs=null;
	double l=0;
	
	String wheresql="";
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String date_bs=request.getParameter("date_bs");//���ܿ�ʼʱ��
	if(date_bs!=null)
	{
	date_bs=cf.GB2Uni(date_bs);
	if(!(date_bs.equals("")))	wheresql=" and (to_date(yy_lr_lrsj,'YYYY-MM-DD HH24:Mi')>=(to_date('"+date_bs+"','YYYY-MM-DD'))) ";
	}
	String date_be=request.getParameter("date_be");
	if(date_be!=null)
	{
	date_be=cf.GB2Uni(date_be);
	if(!(date_be.equals("")))	wheresql=" and (to_date(yy_lr_lrsj,'YYYY-MM-DD HH24:Mi')>=(to_date('"+date_be+"','YYYY-MM-DD'))) ";
	}
	ls_sql="select yy_lr_fgs,yy_lrglf_ysbl,yy_lrglf_sjsq,to_number(yy_lrglf_ysbl)-to_number(yy_lrglf_sjsq) i,yy_lrsj_ysbl,yy_lrsj_sjsq,to_number(yy_lrsj_ysbl)-to_number(yy_lrsj_sjsq) j,yy_lrgc_qnpj,yy_lrgc_bzzs,to_number(yy_lrgc_qnpj)-to_number(yy_lrgc_bzzs) k,yy_lrzc_qnpj,yy_lrzc_bzzs,to_number(yy_lrzc_qnpj)-to_number(yy_lrzc_bzzs) l";
	ls_sql+=" from Yy_cx";
	ls_sql+=wheresql;
	ls_sql+=" order by yy_lr_fgs";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_lrList.jsp","","","");
	String[] keyName={"fgs"};
	pageObj.setKey(keyName);
	
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<body>

<table>
<tr height=48>
  <td colspan=21 height=48  align="center">��Ӫ�ؼ�ָ����ܱ�</td>
</tr>
<tr class=xl96 height=28>
  <td colspan=3 height=28>�������ڣ�<span>&nbsp; </span>��<span>&nbsp; </span>����<span>&nbsp; </span>��<span>&nbsp;
  </span>��</td>
  <td colspan=3 height=28>�������ڣ�<span>&nbsp; </span>��<span>&nbsp; </span>����<span>&nbsp; </span>��<span>&nbsp;
  </span>��</td>
  </tr>
 <tr height=28 >
  <td width="100px" rowspan=2>�ֹ�˾</td>
  <td colspan=4>Ŀ��ͻ�����</td>
  <td colspan=4>��ȡ��������</td>
  <td colspan=4>��Ʒ�</td>
  <td colspan=4>���̲�ֵ</td>
  <td colspan=4>���Ĳ�ֵ</td>
 </tr>
 <tr>
  <td  width="100px">���¼ƻ�</td>
  <td  width="100px">�����ۼ�</td>
  <td  width="100px">���´����</td>
  <td  width="100px">����Ԥ��</td>
  <td  width="100px">���¼ƻ�</td>
  <td  width="100px">�����ۼ�</td>
  <td  width="100px">���´����</td>
  <td  width="100px">����Ԥ��</td>
  <td  width="100px">���¼ƻ�</td>
  <td  width="100px">�����ۼ�</td>
  <td  width="100px">���´����</td>
  <td  width="100px">����Ԥ��</td>
  <td  width="100px">���¼ƻ�</td>
  <td  width="100px">�����ۼ�</td>
  <td  width="100px">���´����</td>
  <td  width="100px">����Ԥ��</td>
  <td  width="100px">���¼ƻ�</td>
  <td  width="100px">�����ۼ�</td>
  <td  width="100px">���´����</td>
  <td  width="100px">����Ԥ��</td>
 </tr>
</table>

</body>

</html>
