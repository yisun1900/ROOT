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
	String ls_sql=null;
	String wheresql="";
	String sgph=null;
	String dwbh=null;
	String sgzsl=null;
	String shzsl=null;
	String sgzt=null;
	String lrr=null;
	String lrsj=null;
	String zbshr=null;
	String zbshsj=null;
	String gysxdr=null;
	String gysxdsj=null;
	String bz=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_clsgd.dwbh='"+fgs+"')";
	sgph=request.getParameter("sgph");
	if (sgph!=null)
	{
		sgph=cf.GB2Uni(sgph);
		if (!(sgph.equals("")))	wheresql+=" and  (sgph='"+sgph+"')";
	}
	sgzsl=request.getParameter("sgzsl");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (sgzsl>="+sgzsl+") ";
	}
	sgzsl=request.getParameter("sgzsl2");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (sgzsl<="+sgzsl+") ";
	}
	shzsl=request.getParameter("shzsl");
	if (shzsl!=null)
	{
		shzsl=shzsl.trim();
		if (!(shzsl.equals("")))	wheresql+=" and  (shzsl>="+shzsl+") ";
	}
	shzsl=request.getParameter("shzsl2");
	if (shzsl!=null)
	{
		shzsl=shzsl.trim();
		if (!(shzsl.equals("")))	wheresql+=" and  (shzsl<="+shzsl+") ";
	}
	sgzt=request.getParameter("sgzt");
	if (sgzt!=null)
	{
		sgzt=cf.GB2Uni(sgzt);
		if (!(sgzt.equals("")))	wheresql+=" and  (sgzt='"+sgzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	zbshr=request.getParameter("zbshr");
	if (zbshr!=null)
	{
		zbshr=cf.GB2Uni(zbshr);
		if (!(zbshr.equals("")))	wheresql+=" and  (zbshr='"+zbshr+"')";
	}
	zbshsj=request.getParameter("zbshsj");
	if (zbshsj!=null)
	{
		zbshsj=zbshsj.trim();
		if (!(zbshsj.equals("")))	wheresql+="  and (zbshsj>=TO_DATE('"+zbshsj+"','YYYY/MM/DD'))";
	}
	zbshsj=request.getParameter("zbshsj2");
	if (zbshsj!=null)
	{
		zbshsj=zbshsj.trim();
		if (!(zbshsj.equals("")))	wheresql+="  and (zbshsj<=TO_DATE('"+zbshsj+"','YYYY/MM/DD'))";
	}
	gysxdr=request.getParameter("gysxdr");
	if (gysxdr!=null)
	{
		gysxdr=cf.GB2Uni(gysxdr);
		if (!(gysxdr.equals("")))	wheresql+=" and  (gysxdr='"+gysxdr+"')";
	}
	gysxdsj=request.getParameter("gysxdsj");
	if (gysxdsj!=null)
	{
		gysxdsj=gysxdsj.trim();
		if (!(gysxdsj.equals("")))	wheresql+="  and (gysxdsj>=TO_DATE('"+gysxdsj+"','YYYY/MM/DD'))";
	}
	gysxdsj=request.getParameter("gysxdsj2");
	if (gysxdsj!=null)
	{
		gysxdsj=gysxdsj.trim();
		if (!(gysxdsj.equals("")))	wheresql+="  and (gysxdsj<=TO_DATE('"+gysxdsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT rownum,cl_clsgd.sgph,dwmc,cl_clsgd.sgzsl,cl_clsgd.shzsl,DECODE(sgzt,'1','δ�ύ','2','���ύ','3','һ�����','4','�������','5','�������','7','������','8','��Ӧ���µ�','9','��˲�ͨ��'),DECODE(psfs,'1','����','2','����','9','����'),jhshsj,cl_clsgd.shsj,cl_clsgd.yf,cl_clsgd.pslrr,cl_clsgd.pslrsj,cl_clsgd.lrr,cl_clsgd.lrsj,cl_clsgd.zbshr,cl_clsgd.zbshsj,cl_clsgd.zbshyj,cl_clsgd.ejshr,cl_clsgd.ejshsj,cl_clsgd.ejshyj,cl_clsgd.sjshr,cl_clsgd.sjshsj,cl_clsgd.sjshyj,cl_clsgd.gysxdr,cl_clsgd.gysxdsj,cl_clsgd.bz  ";
	ls_sql+=" FROM cl_clsgd,sq_dwxx  ";
    ls_sql+=" where cl_clsgd.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//	out.print(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Cl_clsgdCxList.jsp","SelectCxCl_clsgd.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sgph","dwbh","sgzsl","shzsl","sgzt","lrr","lrsj","zbshr","zbshsj","gysxdr","gysxdsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sgph"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sgph",};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="viewsgmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sgph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="2%">���</td>
	<td  width="3%">�깺����</td>
	<td  width="4%">�깺��λ</td>
	<td  width="3%">�깺������</td>
	<td  width="3%">���������</td>
	<td  width="3%">�깺״̬</td>
	<td  width="3%">���ͷ�ʽ</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">ʵ���ͻ�ʱ��</td>
	<td  width="3%">�˷�</td>
	<td  width="2%">����¼����</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">һ�������</td>
	<td  width="3%">һ�����ʱ��</td>
	<td  width="10%">һ��������</td>
	<td  width="2%">���������</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="10%">����������</td>
	<td  width="2%">���������</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="10%">����������</td>
	<td  width="2%">��Ӧ���µ���</td>
	<td  width="3%">��Ӧ���µ�ʱ��</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>