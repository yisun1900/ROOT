<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmydmx.xh xh,mmdglxmc,mlxmc,jc_mmydmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,jc_blbj.blxh, DECODE(jc_mmydmx.ctbs,'3','����','4','�ı�') ctbs,dczlmc,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,jc_mmydmx.sl,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmydmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmydmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm  ";
    ls_sql+=" where jc_mmydmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmydmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmydmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmydmx.czbm=dm_czbm.czbm(+) and jc_mmydmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmydmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmydmx.blxhbm=jc_blbj.blxhbm(+)";
    ls_sql+=" and  jc_mmydmx.mlx=jdm_mlx.mlx(+) and jc_mmydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmydmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmydmxList.jsp?yddbh="+yddbh,"","","EditJc_mmydmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","blxh","ctbs","dczlmc","sfsmjcc","sfydc","sl","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmydmxList.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mmydmx where "+chooseitem;

		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ��Ԥ���������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(115);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">ľ���ͺ�</td>
	<td  width="9%">��ɫ</td>
	<td  width="4%">����</td>
	<td  width="5%">��װλ��</td>
	<td  width="5%">��������</td>
	<td  width="10%">�����ͺ�</td>
	<td  width="5%">���ױ���</td>
	<td  width="4%">�ز�</td>
	<td  width="7%">����/�ƿڲ���</td>
	<td  width="4%">�Ƿ��ж���</td>
	<td  width="4%">��������</td>
	<td  width="7%">��Ƭ</td>
	<td  width="16%">��ע</td>
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