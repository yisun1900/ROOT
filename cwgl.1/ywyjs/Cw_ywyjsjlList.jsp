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

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
	String ywy=null;
	String zjxm=null;
	String sgd=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_ywyjsjl.fgsbh='"+fgs+"')";

	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (cw_ywyjsjl.ywy='"+ywy+"')";
	}
	
	
	String cw_ywyjsjl_jsjlh=null;
	String cw_ywyjsjl_lrr=null;
	String cw_ywyjsjl_lrsj=null;
	String cw_ywyjsjl_spbz=null;
	
	
	cw_ywyjsjl_jsjlh=request.getParameter("cw_ywyjsjl_jsjlh");
	if (cw_ywyjsjl_jsjlh!=null)
	{
		cw_ywyjsjl_jsjlh=cf.GB2Uni(cw_ywyjsjl_jsjlh);
		if (!(cw_ywyjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_ywyjsjl.jsjlh='"+cw_ywyjsjl_jsjlh+"')";
	}
	
	cw_ywyjsjl_lrr=request.getParameter("cw_ywyjsjl_lrr");
	if (cw_ywyjsjl_lrr!=null)
	{
		cw_ywyjsjl_lrr=cf.GB2Uni(cw_ywyjsjl_lrr);
		if (!(cw_ywyjsjl_lrr.equals("")))	wheresql+=" and  (cw_ywyjsjl.lrr='"+cw_ywyjsjl_lrr+"')";
	}
	cw_ywyjsjl_lrsj=request.getParameter("cw_ywyjsjl_lrsj");
	if (cw_ywyjsjl_lrsj!=null)
	{
		cw_ywyjsjl_lrsj=cw_ywyjsjl_lrsj.trim();
		if (!(cw_ywyjsjl_lrsj.equals("")))	wheresql+="  and (cw_ywyjsjl.lrsj>=TO_DATE('"+cw_ywyjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_ywyjsjl_lrsj=request.getParameter("cw_ywyjsjl_lrsj2");
	if (cw_ywyjsjl_lrsj!=null)
	{
		cw_ywyjsjl_lrsj=cw_ywyjsjl_lrsj.trim();
		if (!(cw_ywyjsjl_lrsj.equals("")))	wheresql+="  and (cw_ywyjsjl.lrsj<=TO_DATE('"+cw_ywyjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_ywyjsjl_spbz=request.getParameter("cw_ywyjsjl_spbz");
	if (cw_ywyjsjl_spbz!=null)
	{
		cw_ywyjsjl_spbz=cf.GB2Uni(cw_ywyjsjl_spbz);
		if (!(cw_ywyjsjl_spbz.equals("")))	wheresql+=" and  (cw_ywyjsjl.spbz='"+cw_ywyjsjl_spbz+"')";
	}
	
	ls_sql="SELECT cw_ywyjsjl.jsjlh,DECODE(cw_ywyjsjl.spbz,'1','��ʼ����','2','�������','3','����ͨ��','4','����δͨ��'),b.dwmc fgsbh,ywy,cw_ywyjsjl.sjfw,cw_ywyjsjl.sjfw2,cw_ywyjsjl.tcze,cw_ywyjsjl.lrr,cw_ywyjsjl.lrsj,a.dwmc lrbm,cw_ywyjsjl.bz  ";
	ls_sql+=" FROM cw_ywyjsjl,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where cw_ywyjsjl.lrbm=a.dwbh and cw_ywyjsjl.fgsbh=b.dwbh";
    ls_sql+=" and cw_ywyjsjl.spbz in('1','2')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_ywyjsjl.jsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_ywyjsjlList.jsp","SelectCw_ywyjsjl.jsp","","EditCw_ywyjsjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_ywyjsjl_dwbh","cw_ywyjsjl_ywybh","cw_ywyjsjl_sjfw2","cw_ywyjsjl_dyqdze","cw_ywyjsjl_dyqds","cw_ywyjsjl_ywytcbl","cw_ywyjsjl_ywyjsbl","cw_ywyjsjl_dyjss","cw_ywyjsjl_jzssk","cw_ywyjsjl_wgjsje","cw_ywyjsjl_kqtk","cw_ywyjsjl_qdsyjsje","cw_ywyjsjl_sjf","cw_ywyjsjl_sjfksbl","cw_ywyjsjl_sjftcbl","cw_ywyjsjl_dyjsze","cw_ywyjsjl_lrr","cw_ywyjsjl_lrsj","sq_dwxx_dwmc","cw_ywyjsjl_spbz","cw_ywyjsjl_spyj","cw_ywyjsjl_spr","cw_ywyjsjl_spsj","cw_ywyjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_ywyjsjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_ywyjsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">ҵ��Ա����---�޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">�����¼��</td>
	<td  width="6%">����״̬</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="6%">ҵ��Ա</td>
	<td  width="7%">ʱ�䷶Χ��</td>
	<td  width="7%">ʱ�䷶Χ��</td>
	<td  width="8%">����ܶ�</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>
	<td  width="23%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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